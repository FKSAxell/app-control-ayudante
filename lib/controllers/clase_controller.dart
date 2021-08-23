import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/clase_model.dart';
import 'package:app_control_ayudante/response/clases_hoy_response.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'auth_controller.dart';

class ClaseController extends GetxController {
  RxBool loadingEnClase = true.obs;
  RxList<Clase> clases = <Clase>[].obs;

  @override
  void onInit() async {
    await obtenerClasesdeHoy();
    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  Future<bool> obtenerClasesdeHoy() async {
    this.loadingEnClase.value = false;
    final token = await AuthController.getToken();
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/clase/hoy'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    this.loadingEnClase.value = true;
    if (resp.statusCode == 200) {
      final claseHoyResponse = claseHoyResponseFromJson(resp.body);
      if (claseHoyResponse.ok!) {
        clases.value = claseHoyResponse.clases!;
      }

      return true;
    } else {
      return false;
    }
  }
}
