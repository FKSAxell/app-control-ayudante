import 'dart:convert';

import 'package:app_control_ayudante/models/ayudantia_model.dart';
import 'package:app_control_ayudante/models/clase_model.dart';
import 'package:app_control_ayudante/models/favorito_model.dart';

Sesion materiaFromJson(String str) => Sesion.fromJson(json.decode(str));
String materiaToJson(Sesion data) => json.encode(data.toJson());

class Sesion {
  Sesion({
    this.id,
    this.estado,
    this.ayudantia,
    this.horaInicio,
    this.minutoInicio,
    this.horaFin,
    this.minutoFin,
    this.dia,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.v,
    this.clase,
    this.favorito,
  });

  String? id;
  String? estado;
  Ayudantia? ayudantia;
  int? horaInicio;
  int? minutoInicio;
  int? horaFin;
  int? minutoFin;
  int? dia;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  int? v;
  Clase? clase;
  Favorito? favorito;

  factory Sesion.fromJson(Map<String, dynamic> json) => Sesion(
        id: json["_id"],
        estado: json["estado"],
        ayudantia: json['ayudantia'] != null
            ? new Ayudantia.fromJson(json['ayudantia'].runtimeType == String
                ? {"id": json['ayudantia']}
                : json['ayudantia'])
            : null,
        horaInicio: json["horaInicio"],
        minutoInicio: json["minutoInicio"],
        horaFin: json["horaFin"],
        minutoFin: json["minutoFin"],
        dia: json["dia"],
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"])
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"])
            : null,
        v: json["__v"],
        clase: json['clase'] != null
            ? new Clase.fromJson(json['clase'].runtimeType == String
                ? {"id": json['clase']}
                : json['clase'])
            : null,
        favorito: json['favorito'] != null
            ? new Favorito.fromJson(json['favorito'].runtimeType == String
                ? {"id": json['favorito']}
                : json['favorito'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "ayudantia": ayudantia?.toJson(),
        "horaInicio": horaInicio,
        "minutoInicio": minutoInicio,
        "horaFin": horaFin,
        "minutoFin": minutoFin,
        "dia": dia,
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "__v": v,
        "clase": clase?.toJson(),
        "favorito": favorito?.toJson(),
      };
}
