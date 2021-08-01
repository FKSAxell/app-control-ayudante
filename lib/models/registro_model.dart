import 'dart:convert';

import 'package:app_control_ayudante/models/usuario_model.dart';

import 'materia_model.dart';

Registro registroFromJson(String str) => Registro.fromJson(json.decode(str));
String registroToJson(Registro data) => json.encode(data.toJson());

class Registro {
  Registro({
    this.estado,
    this.usuario,
    this.materia,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.id,
  });

  String? estado;
  Usuario? usuario;
  Materia? materia;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  String? id;

  factory Registro.fromJson(Map<String, dynamic> json) => Registro(
        estado: json["estado"],
        usuario: json['usuario'] != null
            ? new Usuario.fromJson(json['usuario'].runtimeType == String
                ? {"id": json['usuario']}
                : json['usuario'])
            : null,
        materia: json['materia'] != null
            ? new Materia.fromJson(json['materia'].runtimeType == String
                ? {"id": json['materia']}
                : json['materia'])
            : null,
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"])
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"])
            : null,
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "usuario": usuario,
        "materia": materia?.toJson(),
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "_id": id,
      };
}
