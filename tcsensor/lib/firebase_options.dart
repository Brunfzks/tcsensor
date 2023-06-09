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
    apiKey: 'AIzaSyCM85H6ehLNoEoESxYgVYlmivNzG1UhH5Y',
    appId: '1:76757530659:web:3329e709d7a0aab9ee5996',
    messagingSenderId: '76757530659',
    projectId: 'tcsensor-69dae',
    authDomain: 'tcsensor-69dae.firebaseapp.com',
    storageBucket: 'tcsensor-69dae.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3vYLwKyxyKdeXwmqL2PF1ibJFSCVpQKE',
    appId: '1:76757530659:android:b60469b38c45bb33ee5996',
    messagingSenderId: '76757530659',
    projectId: 'tcsensor-69dae',
    storageBucket: 'tcsensor-69dae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBc9s4y70RhyTMOqTODfY8KtlSEIotPjwo',
    appId: '1:76757530659:ios:1374b583d694851dee5996',
    messagingSenderId: '76757530659',
    projectId: 'tcsensor-69dae',
    storageBucket: 'tcsensor-69dae.appspot.com',
    iosClientId: '76757530659-q7ver64m7vlbns6j6s4ev200dkgp0vi0.apps.googleusercontent.com',
    iosBundleId: 'com.example.tcsensor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBc9s4y70RhyTMOqTODfY8KtlSEIotPjwo',
    appId: '1:76757530659:ios:c36c8cadac7fe617ee5996',
    messagingSenderId: '76757530659',
    projectId: 'tcsensor-69dae',
    storageBucket: 'tcsensor-69dae.appspot.com',
    iosClientId: '76757530659-5p01v3l9pliotfnmim5ns6d4tk9po5f2.apps.googleusercontent.com',
    iosBundleId: 'com.example.tcsensor.RunnerTests',
  );
}
