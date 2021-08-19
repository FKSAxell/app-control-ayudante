import 'package:app_control_ayudante/global/environment.dart';
import 'package:app_control_ayudante/models/ayudantia_model.dart';

import 'package:app_control_ayudante/models/facultad_model.dart';
import 'package:app_control_ayudante/models/materia_model.dart';
import 'package:app_control_ayudante/response/ayudantes_materia_response.dart';

import 'package:app_control_ayudante/response/materias_facultad_response.dart';
import 'package:app_control_ayudante/response/result_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'auth_controller.dart';

class MateriasFacultadController extends GetxController
    with SingleGetTickerProviderMixin {
  RxBool loading = true.obs;
  RxBool loadingMatFac = true.obs;
  RxBool favorito = false.obs;
  List<Facultad> materiasFacultad = <Facultad>[].obs;
  Rx<Facultad> facultadSelect = Facultad().obs;
  List<Materia> materias = <Materia>[].obs;
  RxList<Ayudantia> ayudantes = <Ayudantia>[].obs;
  TabController? tabCtrl;
  @override
  void onInit() async {
    await obtenerMateriaPorFacultad();
    tabCtrl = TabController(
      length: materiasFacultad.length,
      vsync: this,
      initialIndex: 0,
    );
    if (materiasFacultad.length > 0) {
      facultadSelect.value = materiasFacultad[0];
    }
    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  Future<bool> obtenerMateriaPorFacultad() async {
    this.loadingMatFac.value = false;
    final token = await AuthController.getToken();

    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/facultad/'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    this.loadingMatFac.value = true;
    if (resp.statusCode == 200) {
      final registrosMateriaResponse =
          materiasPorFacultadResponseFromJson(resp.body);
      if (registrosMateriaResponse.ok) {
        materiasFacultad.addAll(registrosMateriaResponse.facultades);

        List<Materia> materiasTodas = [];
        for (Facultad facultad in registrosMateriaResponse.facultades) {
          List<Materia>? materiasTMP = facultad.materia;
          materiasTodas = [...materiasTodas, ...materiasTMP!];
        }

        materias.addAll(materiasTodas);
      }

      return true;
    } else {
      return false;
    }
  }

  //TODO: Mejorar Query Ayudantes
  Future<bool> obtenerAyudantesPorMateria(String idMateria) async {
    this.loading.value = false;
    final token = await AuthController.getToken();

    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/materia/ayudantes/$idMateria'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    this.loading.value = true;
    if (resp.statusCode == 200) {
      final ayudantesMateriaRes =
          ayudantesPorMateriaResponseFromJson(resp.body);
      ayudantes.value = [...ayudantesMateriaRes.ayudantes];

      return true;
    } else {
      return false;
    }
  }

  Future<bool> obtenerEstadoMateriaRegistarada(String idMateria) async {
    final token = await AuthController.getToken();
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/materia/registro/$idMateria'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    if (resp.statusCode == 200) {
      final favoritoResponse = resultResponseFromJson(resp.body);
      favorito.value = favoritoResponse.result;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setEstadoMateriaRegistarada(String idMateria) async {
    final token = await AuthController.getToken();
    final resp = await http.get(
      Uri.parse('${Enviroment.apiUrl}/materia/registro/set/$idMateria'),
      headers: {
        'Content-type': 'application/json',
        'x-token': token!,
      },
    );
    if (resp.statusCode == 200) {
      final favoritoResponse = resultResponseFromJson(resp.body);
      favorito.value = favoritoResponse.result;

      return true;
    } else {
      return false;
    }
  }
}
