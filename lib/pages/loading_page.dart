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
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authCtrl = Get.put(AuthController(), permanent: true);
    Get.put(UserController(), permanent: true);

    final autenticado = await authCtrl.isLoggedIn();
    if (autenticado) {
      //TODO: CONECTAR AL SOCKET SERVER
      Get.offNamed('base');
    } else {
      Get.offNamed('login');
    }
  }
}
