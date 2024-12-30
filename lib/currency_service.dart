import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  final String _baseUrl = "https://v6.exchangerate-api.com/v6/e8dbbf08cb456d4398d7296b/latest";

  // Fetch currency rates and return as a map
  Future<Map<String, dynamic>> fetchRates({String baseCurrency = 'USD'}) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/$baseCurrency"),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to fetch currency rates: ${response.reasonPhrase}");
    }
  }
}
