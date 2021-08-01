import 'dart:convert';

import 'package:app_control_ayudante/models/sesion_model.dart';
import 'package:app_control_ayudante/models/usuario_model.dart';

Favorito materiaFromJson(String str) => Favorito.fromJson(json.decode(str));
String materiaToJson(Favorito data) => json.encode(data.toJson());

class Favorito {
  Favorito({
    this.id,
    this.estado,
    this.usuario,
    this.sesion,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.v,
  });

  String? id;
  String? estado;
  Usuario? usuario;
  Sesion? sesion;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  int? v;

  factory Favorito.fromJson(Map<String, dynamic> json) => Favorito(
        id: json["_id"],
        estado: json["estado"],
        usuario: json['usuario'] != null
            ? new Usuario.fromJson(json['usuario'].runtimeType == String
                ? {"id": json['usuario']}
                : json['usuario'])
            : null,
        sesion: json['sesion'] != null
            ? new Sesion.fromJson(json['sesion'].runtimeType == String
                ? {"id": json['sesion']}
                : json['sesion'])
            : null,
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"])
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"])
            : null,
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "usuario": usuario,
        "sesion": sesion,
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "__v": v,
      };
}
