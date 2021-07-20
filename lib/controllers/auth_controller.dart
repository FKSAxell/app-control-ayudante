import 'dart:convert';

import 'package:app_control_ayudante/controllers/push_notifications_controller.dart';
import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/login_response.dart';
import 'package:app_control_ayudante/models/usuario.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  // Rx<Usuario> usuario = new Usuario().obs;
  RxBool autenticando = false.obs;
  RxBool registrando = false.obs;
  //Create Storage
  final _storage = GetStorage();

  //getters del token de forma statica
  static Future<String?> getToken() async {
    final _storage = GetStorage();
    final token = await _storage.read('token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = GetStorage();
    await _storage.remove('token');
  }

  Future<bool> login(String email, String password) async {
    this.autenticando.value = true;
    final data = {
      'email': email,
      'password': password,
      'tokenFCM': PushNotificationController.token
    };

    final resp = await http.post(
      Uri.parse('${Enviroment.apiUrl}/login'),
      body: jsonEncode(data),
      headers: {'Content-type': 'application/json'},
    );

    this.autenticando.value = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      final userCtrl = Get.find<UserController>();
      userCtrl.usuario.value = loginResponse.usuario;
      print(usuarioToJson(loginResponse.usuario!));

      await this._guardarToken(loginResponse.token);

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
      'tokenFCM': PushNotificationController.token
    };

    final resp = await http.post(
      Uri.parse('${Enviroment.apiUrl}/login/new'),
      body: jsonEncode(data),
      headers: {'Content-type': 'application/json'},
    );

    this.registrando.value = false;
    if (resp.statusCode == 200) {
      // final registerResponse = registerResponseFromJson(resp.body);
      // this.usuario = registerResponse.usuario;
      // await this._guardarToken(registerResponse.token);

      return true;
    } else {
      //TODO: PROBLEMA QUE SEA MAPEADO DESDEL EL BACK PARTE 1
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await this._storage.read('token');
    print(token);
    if (token == null) {
      this.logout();
      return false;
    }
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/login/renew'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token,
      },
    );
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      final userCtrl = Get.find<UserController>();
      userCtrl.usuario.value = loginResponse.usuario;
      await this._guardarToken(loginResponse.token);

      return true;
    } else {
      this.logout();
      return false;
    }
  }

  Future _guardarToken(String? token) async {
    return await _storage.write('token', token);
  }

  Future logout() async {
    // Delete value
    return await _storage.remove('token');
  }
}
