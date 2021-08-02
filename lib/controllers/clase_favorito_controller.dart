import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/clase_model.dart';
import 'package:app_control_ayudante/response/clases_favorito_response.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'auth_controller.dart';

class ClaseFavoritoController extends GetxController {
  RxList<Clase> clases = <Clase>[].obs;

  @override
  void onInit() async {
    await obtenerClasesFavorito();
    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  Future<bool> obtenerClasesFavorito() async {
    final token = await AuthController.getToken();
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/clase'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );

    if (resp.statusCode == 200) {
      final clasesFavoritoResponse = clasesFavoritoResponseFromJson(resp.body);
      if (clasesFavoritoResponse.ok!) {
        clases.value = clasesFavoritoResponse.respuesta!;
      }

      return true;
    } else {
      return false;
    }
  }
}
