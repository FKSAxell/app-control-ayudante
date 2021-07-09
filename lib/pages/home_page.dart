import 'package:app_control_ayudante/controllers/auth_controller.dart';
import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff243165),
        centerTitle: true,
        title: Text('Estudiante'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
        ],
      ),
      drawer: _MenuPrincipal(),
      body: Center(
        child: Container(
          child: Text(
              '${userCtrl.usuario.value!.nombre}\n${userCtrl.usuario.value!.email}'),
        ),
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  final userCtrl = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Color(0xff243165),
                  child: Text(
                    userCtrl.usuario.value!.nombre!
                        .substring(0, 2)
                        .toUpperCase(),
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Color(0xff243165)),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Get.offNamed('login');
                AuthController.deleteToken();
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}