import 'dart:convert';

import 'package:app_control_ayudante/models/asistencia_model.dart';
import 'package:app_control_ayudante/models/sesion_model.dart';
import 'package:app_control_ayudante/models/ubicacion_model.dart';

Clase materiaFromJson(String str) => Clase.fromJson(json.decode(str));
String materiaToJson(Clase data) => json.encode(data.toJson());

class Clase {
  Clase({
    this.id,
    this.estado,
    this.sesion,
    this.tema,
    this.descripcion,
    this.enlace,
    this.ubicacion,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.v,
    this.fechaClaseInicio,
    this.fechaClaseFin,

    //tmp
    this.asistencia,
    this.enClase,
  });

  String? id;
  String? tema;
  String? estado;
  String? descripcion;
  String? enlace;
  Ubicacion? ubicacion;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  DateTime? fechaClaseInicio;
  Sesion? sesion;
  int? v;
  DateTime? fechaClaseFin;
  //TMP
  Asistencia? asistencia;
  bool? enClase;

  factory Clase.fromJson(Map<String, dynamic> json) => Clase(
        id: json["_id"],
        estado: json["estado"],
        sesion: json['sesion'] != null
            ? new Sesion.fromJson(json['sesion'].runtimeType == String
                ? {"id": json['sesion']}
                : json['sesion'])
            : null,
        tema: json["tema"],
        descripcion: json["descripcion"],
        enlace: json["enlace"],
        ubicacion: json['ubicacion'] != null
            ? new Ubicacion.fromJson(json['ubicacion'].runtimeType == String
                ? {"id": json['ubicacion']}
                : json['ubicacion'])
            : null,
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"])
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"])
            : null,
        v: json["__v"],
        fechaClaseInicio: json["fechaClaseInicio"] != null
            ? DateTime.parse(json["fechaClaseInicio"])
            : null,
        fechaClaseFin: json["fechaClaseFin"] != null
            ? DateTime.parse(json["fechaClaseFin"])
            : null,
        asistencia: json['asistencia'] != null
            ? new Asistencia.fromJson(json['asistencia'].runtimeType == String
                ? {"id": json['asistencia']}
                : json['asistencia'])
            : null,
        enClase: json['enClase'],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "sesion": sesion,
        "tema": tema,
        "descripcion": descripcion,
        "enlace": enlace,
        "ubicacion": ubicacion,
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "__v": v,
        "fechaClaseInicio": fechaClaseInicio?.toIso8601String(),
        "fechaClaseFin": fechaClaseFin?.toIso8601String(),
      };
}
