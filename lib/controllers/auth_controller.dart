import 'dart:convert';

import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/login_response.dart';
import 'package:app_control_ayudante/models/register_response.dart';
import 'package:app_control_ayudante/models/usuario.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  // Rx<Usuario> usuario = new Usuario().obs;
  RxBool autenticando = false.obs;
  RxBool registrando = false.obs;

  Future<bool> login(String email, String password) async {
    this.autenticando.value = true;
    final data = {
      'email': email,
      'password': password,
    };

    final resp = await http.post(
      '${Enviroment.apiUrl}/login',
      body: jsonEncode(data),
      headers: {'Content-type': 'application/json'},
    );

    this.autenticando.value = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      final authCtrl = Get.put(UserController(), permanent: true);
      authCtrl.usuario.value = loginResponse.usuario;

      // await this._guardarToken(loginResponse.token);

      return true;
    } else {
      return false;
    }
  }

  Future register(String nombre, String email, String password) async {
    this.registrando.value = true;
    final data = {
      'nombre': nombre,
      'email': email,
      'password': password,
    };

    final resp = await http.post(
      '${Enviroment.apiUrl}/login/new',
      body: jsonEncode(data),
      headers: {'Content-type': 'application/json'},
    );

    this.registrando.value = false;
    if (resp.statusCode == 200) {
      final registerResponse = registerResponseFromJson(resp.body);
      // this.usuario = registerResponse.usuario;
      // await this._guardarToken(registerResponse.token);

      return true;
    } else {
      //TODO: PROBLEMA QUE SEA MAPEADO DESDEL EL BACK PARTE 1
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }
}
