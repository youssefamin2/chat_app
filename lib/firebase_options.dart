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
    apiKey: 'AIzaSyC7K0xXVe9wbOQ0OL_GzEP8mqJKyHUEchc',
    appId: '1:211184535870:web:faf7fcbf616c87a5d6846f',
    messagingSenderId: '211184535870',
    projectId: 'chat-app-2e578',
    authDomain: 'chat-app-2e578.firebaseapp.com',
    storageBucket: 'chat-app-2e578.firebasestorage.app',
    measurementId: 'G-JGRN9B1GNJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBta1LprIkHRqoBaz_aCdOsiShN1JRzODM',
    appId: '1:211184535870:android:a3427cd38fdd3aa8d6846f',
    messagingSenderId: '211184535870',
    projectId: 'chat-app-2e578',
    storageBucket: 'chat-app-2e578.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeIkzmfAuN7a3RcNnU58IbOYNXGwcm_BY',
    appId: '1:211184535870:ios:467f4c37b349381cd6846f',
    messagingSenderId: '211184535870',
    projectId: 'chat-app-2e578',
    storageBucket: 'chat-app-2e578.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeIkzmfAuN7a3RcNnU58IbOYNXGwcm_BY',
    appId: '1:211184535870:ios:467f4c37b349381cd6846f',
    messagingSenderId: '211184535870',
    projectId: 'chat-app-2e578',
    storageBucket: 'chat-app-2e578.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC7K0xXVe9wbOQ0OL_GzEP8mqJKyHUEchc',
    appId: '1:211184535870:web:69566c09bb494d7ad6846f',
    messagingSenderId: '211184535870',
    projectId: 'chat-app-2e578',
    authDomain: 'chat-app-2e578.firebaseapp.com',
    storageBucket: 'chat-app-2e578.firebasestorage.app',
    measurementId: 'G-Y8SRTRC300',
  );
}
