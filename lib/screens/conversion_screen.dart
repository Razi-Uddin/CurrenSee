import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:currensee/currency_service.dart';
=======
import 'package:firebase_auth/firebase_auth.dart';
import '../currency_service.dart';
import '../database_service.dart';
>>>>>>> 5534113 (Initial commit)

class ConversionScreen extends StatefulWidget {
  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  final CurrencyService _service = CurrencyService();
<<<<<<< HEAD
  final TextEditingController _amountController = TextEditingController();

  String _baseCurrency = 'USD';   // Base currency is USD
  String _targetCurrency = 'EUR'; // Default target currency is EUR
=======
  final DatabaseService _dbService = DatabaseService();
  final TextEditingController _amountController = TextEditingController();

  String _baseCurrency = 'USD';
  String _targetCurrency = 'EUR';
>>>>>>> 5534113 (Initial commit)
  double _conversionResult = 0.0;
  List<String> _currencies = [];

  @override
  void initState() {
    super.initState();
    _fetchCurrencies();
  }

<<<<<<< HEAD
  // Fetch currency rates and populate the currency list
=======
>>>>>>> 5534113 (Initial commit)
  Future<void> _fetchCurrencies() async {
    try {
      final data = await _service.fetchRates(baseCurrency: _baseCurrency);
      setState(() {
        _currencies = (data['conversion_rates'] as Map<String, dynamic>).keys.toList();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching currencies: $e")),
      );
    }
  }

<<<<<<< HEAD
  // Convert the entered amount to target currency
  Future<void> _convertCurrency() async {
    if (_amountController.text.isEmpty) {
      return;
    }
=======
  Future<void> _convertCurrency() async {
    if (_amountController.text.isEmpty) return;
>>>>>>> 5534113 (Initial commit)

    final amount = double.tryParse(_amountController.text);
    if (amount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid amount entered!")),
      );
      return;
    }

    try {
      final data = await _service.fetchRates(baseCurrency: _baseCurrency);
      final rate = data['conversion_rates'][_targetCurrency];
      setState(() {
        _conversionResult = amount * rate;
      });
<<<<<<< HEAD
=======

      // Save to Firestore
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _dbService.saveConversion(
          userId: user.uid,
          baseCurrency: _baseCurrency,
          targetCurrency: _targetCurrency,
          amount: amount,
          conversionResult: _conversionResult,
        );
      }
>>>>>>> 5534113 (Initial commit)
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error converting currency: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Conversion"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter amount in $_baseCurrency"),
            ),
            const SizedBox(height: 16),
<<<<<<< HEAD
            // Base currency dropdown
            DropdownButton<String>(
              value: _baseCurrency,
              onChanged: _currencies.isEmpty
                  ? null
                  : (value) {
                setState(() {
                  _baseCurrency = value!;
                  _fetchCurrencies(); // Fetch rates when base currency changes
                });
              },
              items: _currencies.isEmpty
                  ? []
                  : _currencies
                  .map((currency) => DropdownMenuItem(
                value: currency,
                child: Text(currency),
              ))
                  .toList(),
              hint: const Text("Loading..."),
            ),
            const SizedBox(height: 16),
            // Target currency dropdown
            DropdownButton<String>(
              value: _targetCurrency,
              onChanged: _currencies.isEmpty
                  ? null
                  : (value) {
=======
            DropdownButton<String>(
              value: _baseCurrency,
              onChanged: (value) {
                setState(() {
                  _baseCurrency = value!;
                  _fetchCurrencies();
                });
              },
              items: _currencies.map((currency) => DropdownMenuItem(
                value: currency,
                child: Text(currency),
              )).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _targetCurrency,
              onChanged: (value) {
>>>>>>> 5534113 (Initial commit)
                setState(() {
                  _targetCurrency = value!;
                });
              },
<<<<<<< HEAD
              items: _currencies.isEmpty
                  ? []
                  : _currencies
                  .map((currency) => DropdownMenuItem(
                value: currency,
                child: Text(currency),
              ))
                  .toList(),
              hint: const Text("Loading..."),
=======
              items: _currencies.map((currency) => DropdownMenuItem(
                value: currency,
                child: Text(currency),
              )).toList(),
>>>>>>> 5534113 (Initial commit)
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: const Text("Convert"),
            ),
            const SizedBox(height: 16),
            Text(
              "Conversion Result: $_conversionResult $_targetCurrency",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
