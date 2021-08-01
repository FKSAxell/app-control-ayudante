// To parse this JSON data, do
//
//     final ayudantesPorMateriaResponse = ayudantesPorMateriaResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_control_ayudante/models/ayudantia_model.dart';

AyudantesPorMateriaResponse ayudantesPorMateriaResponseFromJson(String str) =>
    AyudantesPorMateriaResponse.fromJson(json.decode(str));

String ayudantesPorMateriaResponseToJson(AyudantesPorMateriaResponse data) =>
    json.encode(data.toJson());

class AyudantesPorMateriaResponse {
  AyudantesPorMateriaResponse({
    required this.ok,
    required this.ayudantes,
  });

  bool ok;
  List<Ayudantia> ayudantes;

  factory AyudantesPorMateriaResponse.fromJson(Map<String, dynamic> json) =>
      AyudantesPorMateriaResponse(
        ok: json["ok"],
        ayudantes: List<Ayudantia>.from(
            json["ayudantes"].map((x) => Ayudantia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "ayudantes": List<dynamic>.from(ayudantes.map((x) => x.toJson())),
      };
}
