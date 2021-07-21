import 'package:app_control_ayudante/controllers/auth_controller.dart';
import 'package:app_control_ayudante/controllers/materias_facultad_controller.dart';
import 'package:app_control_ayudante/controllers/menu_controller.dart';
import 'package:app_control_ayudante/controllers/registros_controller.dart';
import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:app_control_ayudante/pages/asistencia_page.dart';
import 'package:app_control_ayudante/pages/ayudantia_page.dart';
import 'package:app_control_ayudante/pages/estudiante_page.dart';
import 'package:app_control_ayudante/pages/horario_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.find<UserController>();
    final menuCtrl = Get.put(MenuController());
    Get.put(RegistrosController());
    Get.put(MateriasFacultadController());

    PageController pageCtrl =
        PageController(initialPage: menuCtrl.selectMenuOpt.value);
    final size = MediaQuery.of(context).size;
    final titulos = ["Ayudantías", "Horario", "Asitencia", "Estudiante"];
    return Scaffold(
      appBar: AppBar(
        // backwardsCompatibility: false,
        // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.orange),
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Color(0xff243165),
        centerTitle: true,
        title: Obx(() => Text(titulos[menuCtrl.selectMenuOpt.value])),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
            splashRadius: 22,
          )
        ],
      ),
      drawer: _MenuPrincipal(),
      body: Container(
        height: size.height,
        child: PageView(
          physics: BouncingScrollPhysics(),
          controller: pageCtrl,
          onPageChanged: (value) {
            menuCtrl.selectMenuOpt.value = value;
          },
          children: [
            AyudantiaPage(),
            HorarioPage(),
            AsistenciaPage(),
            EstudiantePage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          // selectedItemColor: Color(0xff243165),
          fixedColor: Color(0xff243165),
          currentIndex: menuCtrl.selectMenuOpt.value,
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
          onTap: (int i) {
            //TODO: Axell del futuro OJO Discutir Animación con tu yo del pasado
            pageCtrl.animateToPage(i,
                duration: Duration(milliseconds: 1000),
                curve: Curves.fastLinearToSlowEaseIn);
            // pageCtrl.jumpToPage(i);
            menuCtrl.selectMenuOpt.value = i;
          },
        ),
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();
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
                    userCtrl.usuario.value!.nombre
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
