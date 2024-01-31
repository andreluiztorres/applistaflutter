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
    apiKey: 'AIzaSyAomgXhlaH_ErYWByd5EUMLLw1dGCjnqcE',
    appId: '1:988718375465:web:851c923b8e9fdd9d42b238',
    messagingSenderId: '988718375465',
    projectId: 'testeappflutter-d6e7c',
    authDomain: 'testeappflutter-d6e7c.firebaseapp.com',
    storageBucket: 'testeappflutter-d6e7c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCccdGFK17KzBHr9ulWMKjFig-Nkg081nM',
    appId: '1:988718375465:android:4636e9f76cdf324e42b238',
    messagingSenderId: '988718375465',
    projectId: 'testeappflutter-d6e7c',
    storageBucket: 'testeappflutter-d6e7c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCM2gXp8Xap_1r7AY7lat5udFe_3LyR-js',
    appId: '1:988718375465:ios:ff49032b2d01536f42b238',
    messagingSenderId: '988718375465',
    projectId: 'testeappflutter-d6e7c',
    storageBucket: 'testeappflutter-d6e7c.appspot.com',
    iosBundleId: 'com.example.applista',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCM2gXp8Xap_1r7AY7lat5udFe_3LyR-js',
    appId: '1:988718375465:ios:f7e78fbc56bb2c1c42b238',
    messagingSenderId: '988718375465',
    projectId: 'testeappflutter-d6e7c',
    storageBucket: 'testeappflutter-d6e7c.appspot.com',
    iosBundleId: 'com.example.applista.RunnerTests',
  );
}
