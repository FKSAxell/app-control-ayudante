import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/clases_sesiones_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'auth_controller.dart';

class SesionController extends GetxController
    with SingleGetTickerProviderMixin {
  List<Sesiones> sesiones = <Sesiones>[
    Sesiones(id: 1, sesion: []),
    Sesiones(id: 2, sesion: []),
    Sesiones(id: 3, sesion: []),
    Sesiones(id: 4, sesion: []),
    Sesiones(id: 5, sesion: []),
    Sesiones(id: 6, sesion: []),
    Sesiones(id: 7, sesion: []),
  ].obs;

  TabController? tabCtrl;
  @override
  void onInit() async {
    await obtenerClasesPorSesionesFavoritas();
    tabCtrl = TabController(
      length: sesiones.length,
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

  Future<bool> obtenerClasesPorSesionesFavoritas() async {
    final token = await AuthController.getToken();
    final userCtrl = Get.find<UserController>();
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/sesion/${userCtrl.usuario.value!.uid}'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    if (resp.statusCode == 200) {
      final clasesSesionesResponse =
          clasesPorSesionesResponseFromJson(resp.body);
      if (clasesSesionesResponse.ok) {
        for (Sesiones item in clasesSesionesResponse.sesiones!) {
          sesiones[item.id - 1].sesion = [...item.sesion];
        }
      }

      return true;
    } else {
      return false;
    }
  }
}
