import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
<<<<<<< HEAD
=======
import 'screens/splash_screen.dart';
>>>>>>> 5534113 (Initial commit)
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/conversion_screen.dart';
<<<<<<< HEAD
=======
import 'screens/history_screen.dart';
>>>>>>> 5534113 (Initial commit)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CurrenSee',
<<<<<<< HEAD
      initialRoute: '/login',
      routes: {
=======
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
>>>>>>> 5534113 (Initial commit)
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/convert': (context) => ConversionScreen(),
<<<<<<< HEAD
=======
        '/history': (context) => HistoryScreen(),
>>>>>>> 5534113 (Initial commit)
      },
    );
  }
}
