import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InicializandoPage extends StatelessWidget {
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
    return Future.delayed(Duration(seconds: 2), () => Get.offNamed('ingreso'));
    // final authService = Provider.of<AuthService>(context, listen: false);
    // final autenticado = await authService.isLoggerdIn();
    // if (autenticado) {
    //   //TODO: CONECTAR AL SOCKET SERVER
    //   // Navigator.pushReplacementNamed(context, 'usuarios');
    //   Navigator.pushReplacement(
    //     context,
    //     PageRouteBuilder(
    //       pageBuilder: (_, __, ___) => UsuariosPage(),
    //       transitionDuration: Duration(milliseconds: 0),
    //     ),
    //   );
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     PageRouteBuilder(
    //       pageBuilder: (_, __, ___) => LoginPage(),
    //       transitionDuration: Duration(milliseconds: 0),
    //     ),
    //   );
    // }
  }
}
