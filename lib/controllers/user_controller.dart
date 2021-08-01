import 'package:app_control_ayudante/models/usuario_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<Usuario?> usuario = new Usuario(
    email: '',
    estado: '',
    fechaActualizacion: DateTime.now(),
    fechaCreacion: DateTime.now(),
    nombre: '',
    rol: [],
    id: '',
  ).obs;
}
