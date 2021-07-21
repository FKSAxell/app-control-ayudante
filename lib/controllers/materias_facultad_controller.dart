import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/facultad.dart';
import 'package:app_control_ayudante/models/materias_facultad_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'auth_controller.dart';

class MateriasFacultadController extends GetxController
    with SingleGetTickerProviderMixin {
  List<Facultade> materiasFacultad = <Facultade>[].obs;
  List<Materia> materias = <Materia>[].obs;
  TabController? tabCtrl;
  @override
  void onInit() async {
    await obtenerMateriaPorFacultad();
    tabCtrl = TabController(
      length: materiasFacultad.length,
      vsync: this,
      initialIndex: 0,
    );
    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  Future<bool> obtenerMateriaPorFacultad() async {
    final token = await AuthController.getToken();

    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/facultad/'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    if (resp.statusCode == 200) {
      final registrosMateriaResponse =
          materiasPorFacultadResponseFromJson(resp.body);
      if (registrosMateriaResponse.ok) {
        materiasFacultad.addAll(registrosMateriaResponse.facultades);
        List<Materia> materiasTodas = [];
        for (Facultade facultad in registrosMateriaResponse.facultades) {
          List<Materia> materiasTMP = facultad.materia;
          materiasTodas = [...materiasTodas, ...materiasTMP];
        }

        materias.addAll(materiasTodas);
      }

      return true;
    } else {
      return false;
    }
  }
}
