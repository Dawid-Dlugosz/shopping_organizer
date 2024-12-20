import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class UserHelper {
  static Future<String> getFCMToken(
      {required FirebaseMessaging firebaseMessaging}) async {
    late final String fcmToken;

    if (Platform.isIOS) {
      fcmToken = await firebaseMessaging.getAPNSToken() ?? '';
    } else {
      fcmToken = await firebaseMessaging.getToken() ?? '';
    }

    return fcmToken;
  }
}
