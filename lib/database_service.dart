import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference _conversions =
  FirebaseFirestore.instance.collection('conversions');

  Future<void> saveConversion({
    required String userId,
    required String baseCurrency,
    required String targetCurrency,
    required double amount,
    required double conversionResult,
  }) async {
    try {
      await _conversions.add({
        'userId': userId,
        'baseCurrency': baseCurrency,
        'targetCurrency': targetCurrency,
        'amount': amount,
        'conversionResult': conversionResult,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception("Error saving conversion: $e");
    }
  }
}
