import 'package:flutter/material.dart';
import 'package:currensee/currency_service.dart';

class ExchangeRateList extends StatefulWidget {
  @override
  _ExchangeRateListState createState() => _ExchangeRateListState();
}

class _ExchangeRateListState extends State<ExchangeRateList> {
  final CurrencyService _service = CurrencyService();
  String _baseCurrency = 'USD';
  Map<String, dynamic> _rates = {};
  List<String> _currencies = [];

  @override
  void initState() {
    super.initState();
    _fetchCurrencies();
  }

  Future<void> _fetchCurrencies() async {
    try {
      final data = await _service.fetchRates(baseCurrency: _baseCurrency);
      setState(() {
        _currencies = data['conversion_rates'].keys.toList();
        _rates = data['conversion_rates'];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching currencies: $e")),
      );
    }
  }

  Future<void> _updateRates() async {
    try {
      final data = await _service.fetchRates(baseCurrency: _baseCurrency);
      setState(() {
        _rates = data['conversion_rates'];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error updating rates: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exchange Rate List")),
      body: Column(
        children: [
          // Dropdown for selecting base currency
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: _baseCurrency,
              onChanged: (value) {
                setState(() {
                  _baseCurrency = value!;
                  _updateRates();
                });
              },
              items: _currencies
                  .map((currency) =>
                  DropdownMenuItem(
                    value: currency,
                    child: Text(currency),
                  ))
                  .toList(),
              hint: const Text("Select Base Currency"),
            ),
          ),
          const SizedBox(height: 16),
          // Table of exchange rates
          Expanded(
            child: _rates.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      // Table header
                      const TableRow(
                        decoration: BoxDecoration(color: Colors.grey),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Currency',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Symbol',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Rate',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Table rows with currency data
                      ..._rates.entries.map(
                            (entry) =>
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(entry.key),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(_getCurrencySymbol(entry.key)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    entry.value.toStringAsFixed(6),
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrencySymbol(String currencyCode) {
    const symbols = {
      'AED': 'د.إ',
      'AFN': '؋',
      'ALL': 'L',
      'AMD': '֏',
      'ANG': 'ƒ',
      'AOA': 'Kz',
      'ARS': '\$',
      'AUD': 'A\$',
      'AWG': 'ƒ',
      'AZN': '₼',
      'BAM': 'KM',
      'BBD': '\$',
      'BDT': '৳',
      'BGN': 'лв',
      'BHD': '.د.ب',
      'BIF': '₣',
      'BMD': '\$',
      'BND': '\$',
      'BOB': 'Bs.',
      'BRL': 'R\$',
      'BSD': '\$',
      'BTN': 'Nu.',
      'BWP': 'P',
      'BYN': 'Br',
      'BZD': 'BZ\$',
      'CAD': 'C\$',
      'CDF': '₣',
      'CHF': 'CHF',
      'CLP': '\$',
      'CNY': '¥',
      'COP': '\$',
      'CRC': '₡',
      'CUP': '₱',
      'CVE': 'Esc',
      'CZK': 'Kč',
      'DJF': '₣',
      'DKK': 'kr',
      'DOP': 'RD\$',
      'DZD': 'د.ج',
      'EGP': '£',
      'ERN': 'Nfk',
      'ETB': 'Br',
      'EUR': '€',
      'FJD': '\$',
      'FKP': '£',
      'FOK': 'kr',
      'GBP': '£',
      'GEL': '₾',
      'GGP': '£',
      'GHS': '₵',
      'GIP': '£',
      'GMD': 'D',
      'GNF': '₣',
      'GTQ': 'Q',
      'GYD': '\$',
      'HKD': 'HK\$',
      'HNL': 'L',
      'HRK': 'kn',
      'HTG': 'G',
      'HUF': 'Ft',
      'IDR': 'Rp',
      'ILS': '₪',
      'IMP': '£',
      'INR': '₹',
      'IQD': 'ع.د',
      'IRR': '﷼',
      'ISK': 'kr',
      'JEP': '£',
      'JMD': 'J\$',
      'JOD': 'د.ا',
      'JPY': '¥',
      'KES': 'KSh',
      'KGS': 'с',
      'KHR': '៛',
      'KID': '\$',
      'KMF': '₣',
      'KRW': '₩',
      'KWD': 'د.ك',
      'KYD': 'CI\$',
      'KZT': '₸',
      'LAK': '₭',
      'LBP': 'ل.ل',
      'LKR': 'Rs',
      'LRD': '\$',
      'LSL': 'L',
      'LYD': 'ل.د',
      'MAD': 'د.م.',
      'MDL': 'L',
      'MGA': 'Ar',
      'MKD': 'ден',
      'MMK': 'K',
      'MNT': '₮',
      'MOP': 'MOP\$',
      'MRU': 'UM',
      'MUR': '₨',
      'MVR': 'ރ.',
      'MWK': 'MK',
      'MXN': '\$',
      'MYR': 'RM',
      'MZN': 'MT',
      'NAD': '\$',
      'NGN': '₦',
      'NIO': 'C\$',
      'NOK': 'kr',
      'NPR': '₨',
      'NZD': 'NZ\$',
      'OMR': '﷼',
      'PAB': 'B/.',
      'PEN': 'S/',
      'PGK': 'K',
      'PHP': '₱',
      'PKR': '₨',
      'PLN': 'zł',
      'PYG': '₲',
      'QAR': 'ر.ق',
      'RON': 'lei',
      'RSD': 'дин',
      'RUB': '₽',
      'RWF': '₣',
      'SAR': '﷼',
      'SBD': '\$',
      'SCR': '₨',
      'SDG': 'ج.س.',
      'SEK': 'kr',
      'SGD': 'S\$',
      'SHP': '£',
      'SLL': 'Le',
      'SOS': 'Sh',
      'SRD': '\$',
      'SSP': '£',
      'STN': 'Db',
      'SYP': 'ل.س',
      'SZL': 'L',
      'THB': '฿',
      'TJS': 'SM',
      'TMT': 'm',
      'TND': 'د.ت',
      'TOP': 'T\$',
      'TRY': '₺',
      'TTD': 'TT\$',
      'TVD': '\$',
      'TWD': 'NT\$',
      'TZS': 'Sh',
      'UAH': '₴',
      'UGX': 'Sh',
      'USD': '\$',
      'UYU': '\$U',
      'UZS': 'сўм',
      'VES': 'Bs.',
      'VND': '₫',
      'VUV': 'VT',
      'WST': 'T',
      'XAF': '₣',
      'XCD': '\$',
      'XOF': '₣',
      'XPF': '₣',
      'YER': '﷼',
      'ZAR': 'R',
      'ZMW': 'ZK',
      'ZWL': '\$',
    };

    return symbols[currencyCode] ?? '-';
  }
}