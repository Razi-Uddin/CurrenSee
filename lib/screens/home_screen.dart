import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:currensee/screens/exchange_rate_list.dart';
import 'package:currensee/screens/faqs_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String username = user?.email?.split('@').first ?? 'Guest';

    return Scaffold(
      appBar: AppBar(
        title: const Text("CurrenSee Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
<<<<<<< HEAD
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
=======
            onPressed: () => _showLogoutConfirmation(context),
>>>>>>> 5534113 (Initial commit)
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Hi, $username',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text("Exchange Rate List"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExchangeRateList()),
                );
              },
            ),
            ListTile(
              title: const Text("FAQs"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FaqsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to CurrenSee, ${user?.email ?? 'Guest'}!",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/convert'),
              child: const Text("Convert Currency"),
            ),
<<<<<<< HEAD
=======
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text("View Conversion History"),
            ),
>>>>>>> 5534113 (Initial commit)
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout Confirmation"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}
>>>>>>> 5534113 (Initial commit)
