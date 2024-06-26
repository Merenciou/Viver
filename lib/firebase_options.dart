// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB9VmCnZVXKobxBEZSix7md7gNLaNDeuM8',
    appId: '1:417067449558:web:0cbb7d593c6da403795d77',
    messagingSenderId: '417067449558',
    projectId: 'viver-cef81',
    authDomain: 'viver-cef81.firebaseapp.com',
    storageBucket: 'viver-cef81.appspot.com',
    measurementId: 'G-LFC60J14P7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABVAayVcjG92fELuwQYntE4RBuSZztpq4',
    appId: '1:417067449558:android:b8256d98a7b0d8df795d77',
    messagingSenderId: '417067449558',
    projectId: 'viver-cef81',
    storageBucket: 'viver-cef81.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDApawfZd5omyLFl8FmnUugtfAboO570-U',
    appId: '1:417067449558:ios:21a5e2fd8a4deb08795d77',
    messagingSenderId: '417067449558',
    projectId: 'viver-cef81',
    storageBucket: 'viver-cef81.appspot.com',
    iosBundleId: 'com.example.viver',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDApawfZd5omyLFl8FmnUugtfAboO570-U',
    appId: '1:417067449558:ios:3bd23079b500bbeb795d77',
    messagingSenderId: '417067449558',
    projectId: 'viver-cef81',
    storageBucket: 'viver-cef81.appspot.com',
    iosBundleId: 'com.example.viver.RunnerTests',
  );
}
