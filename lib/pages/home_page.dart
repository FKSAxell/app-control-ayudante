import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCtrl = Get.find<UserController>();

    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
              '${authCtrl.usuario.value.nombre} ${authCtrl.usuario.value.email}'),
        ),
      ),
    );
  }
}
