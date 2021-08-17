// To parse this JSON data, do
//
//     final materiasFavoritoUsuarioResponse = materiasFavoritoUsuarioResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_control_ayudante/models/materia_model.dart';

MateriasFavoritoUsuarioResponse materiasFavoritoUsuarioResponseFromJson(
        String str) =>
    MateriasFavoritoUsuarioResponse.fromJson(json.decode(str));

String materiasFavoritoUsuarioResponseToJson(
        MateriasFavoritoUsuarioResponse data) =>
    json.encode(data.toJson());

class MateriasFavoritoUsuarioResponse {
  MateriasFavoritoUsuarioResponse({
    this.ok,
    this.materias,
    this.msg,
  });

  bool? ok;
  List<Materia>? materias;
  String? msg;

  factory MateriasFavoritoUsuarioResponse.fromJson(Map<String, dynamic> json) =>
      MateriasFavoritoUsuarioResponse(
        ok: json["ok"],
        materias: List<Materia>.from(
            json["materias"].map((x) => Materia.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "materias": (this.materias != null)
            ? List<dynamic>.from(materias!.map((x) => x.toJson()))
            : [],
        "msg": msg,
      };
}
