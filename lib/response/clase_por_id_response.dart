// To parse this JSON data, do
//
//     final clasePorIdResponse = clasePorIdResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_control_ayudante/models/clase_model.dart';

ClasePorIdResponse clasePorIdResponseFromJson(String str) =>
    ClasePorIdResponse.fromJson(json.decode(str));

String clasePorIdResponseToJson(ClasePorIdResponse data) =>
    json.encode(data.toJson());

class ClasePorIdResponse {
  ClasePorIdResponse({required this.ok, this.clase, this.msg});

  bool ok;
  Clase? clase;
  String? msg;

  factory ClasePorIdResponse.fromJson(Map<String, dynamic> json) =>
      ClasePorIdResponse(
        ok: json["ok"],
        clase: Clase.fromJson(json["clase"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "clase": clase?.toJson(),
        "msg": msg,
      };
}
