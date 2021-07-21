import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/registro.dart';
import 'package:app_control_ayudante/models/registros_materia_response.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

import 'auth_controller.dart';

class RegistrosController extends GetxController {
  RxList<List<Registro>> registros = <List<Registro>>[].obs;
  List<Registro> registrosTMP = <Registro>[].obs;
  @override
  void onInit() async {
    await obtenerMateriasPorRegistroDeUsuario();
    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  Future<bool> obtenerMateriasPorRegistroDeUsuario() async {
    final token = await AuthController.getToken();
    final userCtrl = Get.find<UserController>();
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/materia/${userCtrl.usuario.value!.uid}'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    if (resp.statusCode == 200) {
      final registrosMateriaResponse =
          registrosMateriaResponseFromJson(resp.body);
      if (registrosMateriaResponse.ok) {
        registrosTMP = registrosMateriaResponse.registros!;
        registros.value = [
          ...partition(registrosMateriaResponse.registros!, 2)
        ];
      }

      return true;
    } else {
      return false;
    }
  }
}
