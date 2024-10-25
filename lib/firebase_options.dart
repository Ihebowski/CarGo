// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

late String apiKeyAndroid;
late String appIdAndroid;
late String apiKeyIos;
late String appIdIos;
late String messagingSenderId;
late String projectId;
late String storageBucket;
late String iosBundleId;

void loadFirebaseOptions() {
  apiKeyAndroid = dotenv.get('ANDROID_API_KEY');
  appIdAndroid = dotenv.get('ANDROID_APP_ID');
  apiKeyIos = dotenv.get('IOS_API_KEY');
  appIdIos = dotenv.get('IOS_APP_ID');
  messagingSenderId = dotenv.get('SENDER_ID');
  projectId = dotenv.get('PROJECT_ID');
  storageBucket = dotenv.get('STORAGE');
  iosBundleId = dotenv.get('BUNDLE_ID');
}

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

  static FirebaseOptions android = FirebaseOptions(
    apiKey: apiKeyAndroid,
    appId: appIdAndroid,
    messagingSenderId: messagingSenderId,
    projectId: projectId,
    storageBucket: storageBucket,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: apiKeyIos,
    appId: appIdIos,
    messagingSenderId: messagingSenderId,
    projectId: projectId,
    storageBucket: storageBucket,
    iosBundleId: iosBundleId,
  );

}