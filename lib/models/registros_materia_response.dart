// To parse this JSON data, do
//
//     final registrosMateriaResponse = registrosMateriaResponseFromJson(jsonString);

import 'dart:convert';

import 'registro.dart';

RegistrosMateriaResponse registrosMateriaResponseFromJson(String str) =>
    RegistrosMateriaResponse.fromJson(json.decode(str));

String registrosMateriaResponseToJson(RegistrosMateriaResponse data) =>
    json.encode(data.toJson());

class RegistrosMateriaResponse {
  RegistrosMateriaResponse(
      {required this.ok, required this.registros, required this.msg});

  bool ok;
  List<Registro>? registros;
  String? msg;

  factory RegistrosMateriaResponse.fromJson(Map<String, dynamic> json) =>
      RegistrosMateriaResponse(
        ok: json["ok"],
        registros: List<Registro>.from(
          json["registros"].map((x) => Registro.fromJson(x)),
        ),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "registros": (this.registros != null)
            ? List<dynamic>.from(registros!.map((x) => x.toJson()))
            : [],
        "msg": msg,
      };
}
