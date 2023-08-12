import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mind_app/main.dart';
import 'package:mind_app/routes/app_router.gr.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
