import 'package:app_control_ayudante/models/usuario.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<Usuario?> usuario = new Usuario().obs;
}
