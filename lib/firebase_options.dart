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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyClVnxujrQxEnZTFmz72kb5q2_Lz7RmTkM',
    appId: '1:864088923493:web:d27bbff7b34ed36c5ed58c',
    messagingSenderId: '864088923493',
    projectId: 'smart-glasses-e0331',
    authDomain: 'smart-glasses-e0331.firebaseapp.com',
    storageBucket: 'smart-glasses-e0331.appspot.com',
    measurementId: 'G-VZTBRK060C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpSKEyIjG9w6Dv1MQYOWeptbwGO6uvrLs',
    appId: '1:864088923493:android:60701dfb8a73111b5ed58c',
    messagingSenderId: '864088923493',
    projectId: 'smart-glasses-e0331',
    storageBucket: 'smart-glasses-e0331.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIp1h2vW0Rk_Kaz3eXWHy0ZK0W9l2KkPI',
    appId: '1:864088923493:ios:f3334dde70d44db95ed58c',
    messagingSenderId: '864088923493',
    projectId: 'smart-glasses-e0331',
    storageBucket: 'smart-glasses-e0331.appspot.com',
    iosClientId: '864088923493-lma4t9gpch4cvkd2b6qj77r97pr6g904.apps.googleusercontent.com',
    iosBundleId: 'com.example.smartglasses',
  );
}