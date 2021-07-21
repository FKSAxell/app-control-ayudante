import 'package:app_control_ayudante/controllers/push_notifications_controller.dart';
import 'package:app_control_ayudante/routes/routes.dart';
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

    // Context!
    PushNotificationController.messagesStream.listen((message) {
      Get.snackbar(
        'Notificación',
        '$message',
        backgroundColor: Colors.white,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'loading',
      getPages: appRoutes,
    );
  }
}




//  Container(
//                       padding: EdgeInsets.only(top: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           BoxMateria(
//                             text: "Fundamentos de Programación",
//                             color: Color(0xfffd79a8),
//                           ),
//                           BoxMateria(
//                             text: "Algebra Lineal",
//                             color: Color(0xff2ecc71),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(top: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           BoxMateria(
//                             text: "Física I",
//                             color: Color(0xff9b59b6),
//                           ),
//                           BoxMateria(
//                             text: "Biología",
//                             color: Color(0xffe67e22),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(top: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           BoxMateria(
//                             text: "Química",
//                             color: Color(0xffe74c3c),
//                           ),
//                           BoxMateria(
//                             text: "Ecología",
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(top: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           BoxMateria(
//                             text: "Ecuaciones Diferenciales",
//                             color: Color(0xfff1c40f),
//                           ),
//                           BoxMateria(
//                             text: "Cálculo I",
//                             color: Color(0xff34495e),
//                           ),
//                         ],
//                       ),
//                     ),