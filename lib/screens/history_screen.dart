import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversion History"),
      ),
      body: FutureBuilder<String?>(
        future: _getUserId(),
        builder: (context, userIdSnapshot) {
          if (!userIdSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final userId = userIdSnapshot.data;
          print("User ID: $userId");  // Debugging: Print the user ID

          if (userId == null) {
            return const Center(
              child: Text("You need to log in to view your history."),
            );
          }

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('conversions')
                .where('userId', isEqualTo: userId)
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show loading only when the stream is waiting for data
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No conversion history found."));
              }

              final documents = snapshot.data!.docs;
              print("Number of documents found: ${documents.length}");  // Debugging: Print documents length

              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final data = documents[index].data() as Map<String, dynamic>;
                  print("Document data: $data");  // Debugging: Print each document's data

                  final timestamp = data['timestamp']?.toDate();
                  final formattedDate = timestamp != null
                      ? DateFormat('yyyy-MM-dd HH:mm:ss').format(timestamp)
                      : "Unknown Date";

                  return ListTile(
                    title: Text(
                      "${data['amount']} ${data['baseCurrency']} to ${data['targetCurrency']}",
                    ),
                    subtitle: Text(
                      "Result: ${data['conversionResult']}\nDate: $formattedDate",
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<String?> _getUserId() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    print("Current User ID: $userId");  // Debugging: Print the current user ID
    return userId;
  }
}
