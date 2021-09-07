import 'package:app_control_ayudante/controllers/clase_controller.dart';
import 'package:app_control_ayudante/controllers/push_notifications_controller.dart';
import 'package:app_control_ayudante/routes/routes.dart';
import 'package:app_control_ayudante/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';

import 'models/ayudantia_model.dart';
import 'models/clase_model.dart';
import 'models/materia_model.dart';
import 'models/sesion_model.dart';
import 'models/ubicacion_model.dart';
import 'models/usuario_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  //TODO:DESCOMENTAR
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

    PushNotificationController.messagesStream.listen((message) async {
      final claseCtrl = Get.put(ClaseController());
      Clase clase = await claseCtrl.obtenerClasePorId(message["clase_id"]);
      Get.toNamed("clase",
          arguments: [clase, message["asistencia_id"] ?? null]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "loading", //'loading',
      getPages: appRoutes,
      theme: Themes.blue,
    );
  }
}
