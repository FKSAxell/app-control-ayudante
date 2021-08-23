import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/clase_model.dart';
import 'package:app_control_ayudante/models/materia_model.dart';
import 'package:app_control_ayudante/response/materias_favorito_usuario_response.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

import 'auth_controller.dart';

class MateriaController extends GetxController {
  RxList<List<Materia>> materias = <List<Materia>>[].obs;
  RxList<Clase> clases = <Clase>[].obs;

  @override
  void onInit() async {
    await obtenerMateriasPorFavoritoDeUsuario();

    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  Future<bool> obtenerMateriasPorFavoritoDeUsuario() async {
    final token = await AuthController.getToken();
    final userCtrl = Get.find<UserController>();
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/materia/${userCtrl.usuario.value!.id}'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    if (resp.statusCode == 200) {
      final materiasFavoritoUsuarioResponse =
          materiasFavoritoUsuarioResponseFromJson(resp.body);
      if (materiasFavoritoUsuarioResponse.ok!) {
        materias.value = [
          ...partition(materiasFavoritoUsuarioResponse.materias!, 2)
        ];
      }

      return true;
    } else {
      return false;
    }
  }
}
