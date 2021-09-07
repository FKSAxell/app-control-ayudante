import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; //TODO

class PushNotificationController {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<Map<String, dynamic>> _messageStream =
      new StreamController.broadcast();
  static Stream<Map<String, dynamic>> get messagesStream =>
      _messageStream.stream;

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.max,
  ); //TODO

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //TODO

  static Future _backgroundHandler(RemoteMessage message) async {
    print('onBackground Handler ${message.messageId}');
    print('_backgroundHandler: ${message.data}');
    _messageStream.add(message.data);
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Handler ${message.messageId}');
    print('_onMessageHandler: ${message.data}');
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel); //TODO

    RemoteNotification? notification = message.notification;
    String iconName = AndroidInitializationSettings('@mipmap/ic_launcher')
        .defaultIcon
        .toString(); //TODO

    // Si `onMessage` es activado con una notificación, construimos nuestra propia
    // notificación local para mostrar a los usuarios, usando el canal creado.
    if (notification != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channel.description,
            icon: iconName,
          ),
        ),
      ); //TODO
    }
    _messageStream.add(message.data);
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp Handler ${message.messageId}');
    print('onMessageOpenApp: ${message.data}');
    _messageStream.add(message.data);
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
    // _messageStream.close();
  }
}
