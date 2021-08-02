// To parse this JSON data, do
//
//     final clasesFavoritoResponse = clasesFavoritoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_control_ayudante/models/clase_model.dart';

ClasesFavoritoResponse clasesFavoritoResponseFromJson(String str) =>
    ClasesFavoritoResponse.fromJson(json.decode(str));

String clasesFavoritoResponseToJson(ClasesFavoritoResponse data) =>
    json.encode(data.toJson());

class ClasesFavoritoResponse {
  ClasesFavoritoResponse({
    this.ok,
    this.respuesta,
  });

  bool? ok;
  List<Clase>? respuesta;

  factory ClasesFavoritoResponse.fromJson(Map<String, dynamic> json) =>
      ClasesFavoritoResponse(
        ok: json["ok"],
        respuesta:
            List<Clase>.from(json["respuesta"].map((x) => Clase.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "respuesta": List<dynamic>.from(respuesta!.map((x) => x.toJson())),
      };
}
