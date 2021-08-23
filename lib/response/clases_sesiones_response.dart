// To parse this JSON data, do
//
//     final clasesPorSesionesResponse = clasesPorSesionesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_control_ayudante/models/sesion_model.dart';

ClasesPorSesionesResponse clasesPorSesionesResponseFromJson(String str) =>
    ClasesPorSesionesResponse.fromJson(json.decode(str));

String clasesPorSesionesResponseToJson(ClasesPorSesionesResponse data) =>
    json.encode(data.toJson());

class ClasesPorSesionesResponse {
  ClasesPorSesionesResponse({required this.ok, this.sesiones, this.msg});

  bool ok;
  List<Sesiones>? sesiones;
  String? msg;

  factory ClasesPorSesionesResponse.fromJson(Map<String, dynamic> json) =>
      ClasesPorSesionesResponse(
        ok: json["ok"],
        sesiones: List<Sesiones>.from(
            json["sesiones"].map((x) => Sesiones.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "sesiones": (this.sesiones != null)
            ? List<dynamic>.from(sesiones!.map((x) => x.toJson()))
            : [],
        "msg": msg
      };
}

class Sesiones {
  Sesiones({
    required this.id,
    required this.sesion,
  });

  int id;
  List<Sesion> sesion;

  factory Sesiones.fromJson(Map<String, dynamic> json) => Sesiones(
        id: json["_id"],
        sesion:
            List<Sesion>.from(json["sesion"].map((x) => Sesion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sesion": List<dynamic>.from(sesion.map((x) => x.toJson())),
      };
}
