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
    apiKey: 'AIzaSyD4bPcfy1OaZFKYbjK5IJXDGVCk8_0DB_Y',
    appId: '1:732974960675:web:af441cca77b92ac438a196',
    messagingSenderId: '732974960675',
    projectId: 'set-of-service-1cacc',
    authDomain: 'set-of-service-1cacc.firebaseapp.com',
    storageBucket: 'set-of-service-1cacc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDF7vR77Ry66yHPmeQLPc23qsJua2tnraI',
    appId: '1:732974960675:android:d587fc3355c21a1938a196',
    messagingSenderId: '732974960675',
    projectId: 'set-of-service-1cacc',
    storageBucket: 'set-of-service-1cacc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDM_j2nt4jfuswFt4zAQCj0K1aKm-6HFpg',
    appId: '1:732974960675:ios:1e467ce24779620b38a196',
    messagingSenderId: '732974960675',
    projectId: 'set-of-service-1cacc',
    storageBucket: 'set-of-service-1cacc.appspot.com',
    iosClientId: '732974960675-2ageh3qike7e2eoevltvu9ubi1roq69d.apps.googleusercontent.com',
    iosBundleId: 'com.example.setOfServiceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDM_j2nt4jfuswFt4zAQCj0K1aKm-6HFpg',
    appId: '1:732974960675:ios:1e467ce24779620b38a196',
    messagingSenderId: '732974960675',
    projectId: 'set-of-service-1cacc',
    storageBucket: 'set-of-service-1cacc.appspot.com',
    iosClientId: '732974960675-2ageh3qike7e2eoevltvu9ubi1roq69d.apps.googleusercontent.com',
    iosBundleId: 'com.example.setOfServiceApp',
  );
}
