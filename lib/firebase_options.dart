// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCV5q0inA797iDAxnG_2cj8OXON1sHE3Sk',
    appId: '1:438586384233:web:f81085d26a961a0c9327f8',
    messagingSenderId: '438586384233',
    projectId: 'currensee-7ef20',
    authDomain: 'currensee-7ef20.firebaseapp.com',
    storageBucket: 'currensee-7ef20.firebasestorage.app',
    measurementId: 'G-Z11D5XW77N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJsNAc7ct-ay6m3T-5hb2PVPrsRm000qQ',
    appId: '1:438586384233:android:f61079378b1d34149327f8',
    messagingSenderId: '438586384233',
    projectId: 'currensee-7ef20',
    storageBucket: 'currensee-7ef20.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuUsW98_JcsxSMqMgZSHGBz7Wg8q3YJ_M',
    appId: '1:438586384233:ios:5ca202678193fa169327f8',
    messagingSenderId: '438586384233',
    projectId: 'currensee-7ef20',
    storageBucket: 'currensee-7ef20.firebasestorage.app',
    iosBundleId: 'com.example.currensee',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuUsW98_JcsxSMqMgZSHGBz7Wg8q3YJ_M',
    appId: '1:438586384233:ios:5ca202678193fa169327f8',
    messagingSenderId: '438586384233',
    projectId: 'currensee-7ef20',
    storageBucket: 'currensee-7ef20.firebasestorage.app',
    iosBundleId: 'com.example.currensee',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCV5q0inA797iDAxnG_2cj8OXON1sHE3Sk',
    appId: '1:438586384233:web:ee69e339367d2b039327f8',
    messagingSenderId: '438586384233',
    projectId: 'currensee-7ef20',
    authDomain: 'currensee-7ef20.firebaseapp.com',
    storageBucket: 'currensee-7ef20.firebasestorage.app',
    measurementId: 'G-L7BJYRBK4Q',
  );
}
