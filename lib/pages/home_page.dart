import 'package:app_control_ayudante/controllers/auth_controller.dart';
import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:app_control_ayudante/pages/ayudantia_page.dart';
import 'package:app_control_ayudante/pages/estudiante_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        // backwardsCompatibility: false,
        // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.orange),

        backgroundColor: Color(0xff243165),
        centerTitle: true,
        title: Text('Estudiante'),
      ),
      drawer: _MenuPrincipal(),
      body: AyudantiaPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff243165),
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Ayudantías",
            icon: Icon(Icons.class__outlined),
          ),
          BottomNavigationBarItem(
            label: "Horario",
            icon: Icon(Icons.schedule),
          ),
          BottomNavigationBarItem(
            label: "Asistencia",
            icon: Icon(Icons.assignment_outlined),
          ),
          BottomNavigationBarItem(
            label: "Estudiante",
            icon: Icon(Icons.person_outline),
          ),
        ],
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
