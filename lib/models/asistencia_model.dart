import 'dart:convert';

import 'package:app_control_ayudante/models/clase_model.dart';
import 'package:app_control_ayudante/models/usuario_model.dart';

Asistencia materiaFromJson(String str) => Asistencia.fromJson(json.decode(str));
String materiaToJson(Asistencia data) => json.encode(data.toJson());

class Asistencia {
  Asistencia({
    this.id,
    this.estado,
    this.usuario,
    this.clase,
    this.calificacion,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.v,
  });

  String? id;
  String? estado;
  Usuario? usuario;
  Clase? clase;
  int? calificacion;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  int? v;

  factory Asistencia.fromJson(Map<String, dynamic> json) => Asistencia(
        id: json["_id"],
        estado: json["estado"],
        usuario: json['usuario'] != null
            ? new Usuario.fromJson(json['usuario'].runtimeType == String
                ? {"id": json['usuario']}
                : json['usuario'])
            : null,
        clase: json['clase'] != null
            ? new Clase.fromJson(json['clase'].runtimeType == String
                ? {"id": json['clase']}
                : json['clase'])
            : null,
        calificacion: json["calificacion"],
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
        "clase": clase,
        "calificacion": calificacion,
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "__v": v,
      };
}
