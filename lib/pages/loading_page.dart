import 'package:app_control_ayudante/controllers/auth_controller.dart';
import 'package:app_control_ayudante/controllers/user_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Center(
            child: CircularProgressIndicator(), //TODO: OJO CARGA
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    //TODO: VERIFICAR SI YA TIENE SESION ACTIVA

    // return Future.delayed(Duration(seconds: 2), () => Get.offNamed('login'));
    // final authService = Provider.of<AuthService>(context, listen: false);
    final authCtrl = Get.put(AuthController(), permanent: true);
    Get.put(UserController(), permanent: true);

    final autenticado = await authCtrl.isLoggedIn();
    if (autenticado) {
      //TODO: CONECTAR AL SOCKET SERVER
      // Navigator.pushReplacementNamed(context, 'usuarios');
      Get.offNamed('home');
    } else {
      Get.offNamed('login');
    }
  }
}
