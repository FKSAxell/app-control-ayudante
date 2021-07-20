import 'dart:convert';

import 'materia.dart';

Registro registroFromJson(String str) => Registro.fromJson(json.decode(str));
String registroToJson(Registro data) => json.encode(data.toJson());

class Registro {
  Registro({
    required this.estado,
    required this.usuario,
    required this.materia,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.uid,
  });

  String estado;
  String usuario;
  Materia materia;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  String? uid;

  factory Registro.fromJson(Map<String, dynamic> json) => Registro(
        estado: json["estado"],
        usuario: json["usuario"],
        materia: Materia.fromJson(json["materia"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "usuario": usuario,
        "materia": materia.toJson(),
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "uid": uid,
      };
}
