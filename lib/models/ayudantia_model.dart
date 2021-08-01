import 'dart:convert';
import 'package:app_control_ayudante/models/sesion_model.dart';

import 'materia_model.dart';
import 'usuario_model.dart';

Ayudantia materiaFromJson(String str) => Ayudantia.fromJson(json.decode(str));
String materiaToJson(Ayudantia data) => json.encode(data.toJson());

class Ayudantia {
  Ayudantia({
    this.id,
    this.estado,
    this.usuario,
    this.materia,
    this.fechaInicio,
    this.fechaFin,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.v,

    //TMP
    this.avg,
    this.sesion,
  });

  String? id;
  String? estado;
  Usuario? usuario;
  Materia? materia;
  DateTime? fechaInicio;
  DateTime? fechaFin;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  int? v;

  //TMP
  List<Sesion>? sesion;
  double? avg;

  factory Ayudantia.fromJson(Map<String, dynamic> json) => Ayudantia(
        id: json["_id"].runtimeType != String
            ? json["_id"]["ayudantia"]
            : json["_id"],
        estado: json["estado"],
        usuario: Usuario.fromJson(json["usuario"]),
        materia: json['materia'] != null
            ? new Materia.fromJson(json['materia'].runtimeType == String
                ? {"id": json['materia']}
                : json['materia'])
            : null,
        fechaInicio: json["fechaInicio"] != null
            ? DateTime.parse(json["fechaInicio"])
            : null,
        fechaFin:
            json["fechaFin"] != null ? DateTime.parse(json["fechaFin"]) : null,
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"])
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"])
            : null,
        v: json["__v"],

        //TMP
        sesion: json["sesion"] != null
            ? List<Sesion>.from(json["sesion"].map(
                (x) => x != null
                    ? new Sesion.fromJson(
                        x.runtimeType == String ? {"id": x} : x)
                    : null,
              ))
            : [],
        avg: json["avg"] == null ? null : json["avg"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "usuario": usuario?.toJson(),
        "materia": materia?.toJson(),
        "fechaInicio": fechaInicio?.toIso8601String(),
        "fechaFin": fechaFin?.toIso8601String(),
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "__v": v,
      };
}
