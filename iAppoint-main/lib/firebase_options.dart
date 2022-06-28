// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAvQDSr7AMNAkCoXYCfoo13k5U-7HcdD3Q',
    appId: '1:278020054006:web:ab2e97bda4218a92c585d7',
    messagingSenderId: '278020054006',
    projectId: 'iappoint-bf549',
    authDomain: 'iappoint-bf549.firebaseapp.com',
    databaseURL:
        'https://iappoint-bf549-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'iappoint-bf549.appspot.com',
    measurementId: 'G-H450QP2YTV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5uUm_I-tMFPM92z2x493jKvJIyngEBFw',
    appId: '1:278020054006:android:d15138c76cb7d5c1c585d7',
    messagingSenderId: '278020054006',
    projectId: 'iappoint-bf549',
    databaseURL:
        'https://iappoint-bf549-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'iappoint-bf549.appspot.com',
  );
}
