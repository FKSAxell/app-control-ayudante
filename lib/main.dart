import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_control_ayudante/pages/ingreso_page.dart';
import 'package:app_control_ayudante/pages/inicializando_page.dart';
import 'package:app_control_ayudante/pages/registro_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'inicializando',
      getPages: [
        GetPage(name: 'inicializando', page: () => InicializandoPage()),
        GetPage(name: 'ingreso', page: () => IngresoPage()),
        GetPage(name: 'registro', page: () => RegistroPage()),
      ],
    );
  }
}
