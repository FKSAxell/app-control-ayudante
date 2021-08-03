import 'package:app_control_ayudante/controllers/registros_controller.dart';
import 'package:app_control_ayudante/controllers/sesion_controller.dart';
import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/ayudantia_model.dart';
import 'package:app_control_ayudante/models/sesion_model.dart';
import 'package:app_control_ayudante/response/result_response.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'auth_controller.dart';

class SesionRegistradaController extends GetxController {
  RxBool loading = true.obs;

  RxList<bool> sesiones = <bool>[].obs;

  Future<bool> obtenerEstadoSesiones(Ayudantia ayudante) async {
    loading.value = false;
    sesiones.value = [];
    List<Sesion> sesionesTMP = ayudante.sesion!;
    for (Sesion sesion in sesionesTMP) {
      if (sesion.id != null) {
        final favTMP = await obtenerEstadoSesionRegistrada(sesion.id!);
        sesiones.add(favTMP);
      }
    }

    loading.value = true;
    return true;
  }

  Future<bool> obtenerEstadoSesionRegistrada(String idSesion) async {
    final token = await AuthController.getToken();
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/materia/favorito/$idSesion'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    if (resp.statusCode == 200) {
      final favoritoResponse = resultResponseFromJson(resp.body);

      return favoritoResponse.result;
    } else {
      return false;
    }
  }

  Future<bool> setEstadoSesionRegistrada(String idSesion, int index) async {
    final token = await AuthController.getToken();
    print(idSesion);
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/materia/favorito/set/$idSesion'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    if (resp.statusCode == 200) {
      final favoritoResponse = resultResponseFromJson(resp.body);
      sesiones[index] = favoritoResponse.result;
      final sesCtrl = Get.find<SesionController>();
      await sesCtrl.obtenerClasesPorSesionesFavoritas();
      return favoritoResponse.result;
    } else {
      return false;
    }
  }
}
