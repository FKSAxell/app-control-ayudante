import 'dart:convert';

import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/login_response.dart';
import 'package:app_control_ayudante/models/usuario.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  Rx<Usuario> usuario = new Usuario().obs;
}
