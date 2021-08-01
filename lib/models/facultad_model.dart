import 'dart:convert';

import 'materia_model.dart';

Facultad facultadFromJson(String str) => Facultad.fromJson(json.decode(str));

String facultadToJson(Facultad data) => json.encode(data.toJson());

class Facultad {
  Facultad(
      {this.estado,
      this.id,
      this.nombre,
      this.codigo,
      this.fechaCreacion,
      this.fechaActualizacion,
      this.v,
      this.materia});

  String? estado;
  String? id;
  String? nombre;
  String? codigo;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  int? v;
  //TMP
  List<Materia>? materia;

  factory Facultad.fromJson(Map<String, dynamic> json) => Facultad(
        estado: json["estado"],
        id: json["_id"],
        nombre: json["nombre"],
        codigo: json["codigo"],
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"])
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"])
            : null,
        v: json["__v"],

        //TMP
        materia: json["materia"] != null
            ? List<Materia>.from(json["materia"].map(
                (x) => x != null
                    ? new Materia.fromJson(
                        x.runtimeType == String ? {"id": x} : x)
                    : null,
              ))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "nombre": nombre,
        "codigo": codigo,
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "__v": v,
      };
}
