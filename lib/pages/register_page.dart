import 'package:app_control_ayudante/controllers/auth_controller.dart';
import 'package:app_control_ayudante/helpers/mostrar_alerta.dart';
import 'package:app_control_ayudante/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:app_control_ayudante/widgets/widgets.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Registro'),
                _Form(),
                Etiqueta(
                  mensaje: '¿Ya tienes cuenta?',
                  textVinculo: 'Ingresa ahora!',
                  ruta: 'login',
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authCtrl = Get.find<AuthController>();
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Entrada(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            textController: nameCtrl,
          ),
          Entrada(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          Entrada(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            isPassword: true,
            // keyboardType: TextInputType.emailAddress,
            textController: passCtrl,
          ),
          Obx(
            () => Boton(
              text: (authCtrl.registrando.value)
                  ? CircularProgressIndicator()
                  : Text(
                      'Registrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
              onPressed: (authCtrl.registrando.value)
                  ? null
                  : () async {
                      //desaparecer teclado :D
                      FocusScope.of(context).unfocus();
                      final registroOk = await authCtrl.register(
                        nameCtrl.text.trim(),
                        emailCtrl.text.trim(),
                        passCtrl.text.trim(),
                      );
                      if (registroOk == true) {
                        //TODO: Conectar a nuestro socket server
                        Get.offNamed('login');
                        Get.snackbar(
                          "Registro Exitoso",
                          "Ya puedes iniciar sesión",
                          backgroundColor: Colors.white,
                        );
                        // mostrarAlerta(
                        //   context,
                        //   'Usuario Registrado',
                        //   '$registroOk',
                        // );

                        // Navigator.pushReplacementNamed(context, 'usuarios');
                      } else {
                        //MOSTRAR ALERTA
                        mostrarAlerta(
                          context,
                          'Registro Incorrecto',
                          '$registroOk',
                        );
                      }
                    },
            ),
          )
        ],
      ),
    );
  }
}
