import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationController {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream =
      new StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    // print( 'onBackground Handler ${ message.messageId }');
    print(message.data);
    _messageStream.add(message.data['type'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print( 'onMessage Handler ${ message.messageId }');
    print(message.data);
    _messageStream.add(message.data['type'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print( 'onMessageOpenApp Handler ${ message.messageId }');
    print(message.data);
    _messageStream.add(message.data['type'] ?? 'No data');
  }

  static Future initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    // await requestPermission();
    //TODO: Firebase Exception ([firebase_messaging/unknown] java.io.IOException: java.util.concurrent.ExecutionException: java.io.IOException: SERVICE_NOT_AVAILABLE)
    token = await FirebaseMessaging.instance.getToken();
    print('Firebase Token: $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // Local Notifications
  }

  // Apple / Web
  // static requestPermission() async {
  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true
  //   );

  //   print('User push notification status ${ settings.authorizationStatus }');

  // }

  static closeStreams() {
    _messageStream.close();
  }
}
