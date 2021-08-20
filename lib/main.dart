import 'package:app_control_ayudante/controllers/push_notifications_controller.dart';
import 'package:app_control_ayudante/routes/routes.dart';
import 'package:app_control_ayudante/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await PushNotificationController.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // PushNotificationController.messagesStream.listen((message) {
    //   Get.snackbar(
    //     'Notificación',
    //     '$message',
    //     backgroundColor: Colors.white,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'loading',
      getPages: appRoutes,
      theme: Themes.blue,
    );
  }
}
