import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FAQs")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _queryController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: "Your Query"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle query submission
                final username = _usernameController.text;
                final email = _emailController.text;
                final query = _queryController.text;

                if (username.isEmpty || email.isEmpty || query.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("All fields are required")),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Query submitted successfully")),
                );

                _usernameController.clear();
                _emailController.clear();
                _queryController.clear();
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
