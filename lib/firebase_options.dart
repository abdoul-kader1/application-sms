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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsIZEc8lPxzkN4d1Nl3Faqd4W5S-4ZnYU',
    appId: '1:222221991409:android:c6cad6244b117adae6d850',
    messagingSenderId: '222221991409',
    projectId: 'application-sms-914f7',
    databaseURL: 'https://application-sms-914f7-default-rtdb.firebaseio.com',
    storageBucket: 'application-sms-914f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlC3wabsGsYG0D54_jyIs2dnlSkB0Fvr8',
    appId: '1:222221991409:ios:a92b487b73b50fc3e6d850',
    messagingSenderId: '222221991409',
    projectId: 'application-sms-914f7',
    databaseURL: 'https://application-sms-914f7-default-rtdb.firebaseio.com',
    storageBucket: 'application-sms-914f7.appspot.com',
    iosClientId: '222221991409-lvdng4ck08i8ujbehk45nju1mogs4j4b.apps.googleusercontent.com',
    iosBundleId: 'com.example.applicationSms',
  );
}
