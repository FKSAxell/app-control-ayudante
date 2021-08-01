import 'dart:convert';

import 'facultad_model.dart';

Materia materiaFromJson(String str) => Materia.fromJson(json.decode(str));
String materiaToJson(Materia data) => json.encode(data.toJson());

class Materia {
  Materia({
    this.estado,
    this.id,
    this.nombre,
    this.codigo,
    this.facultad,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.v,
  });

  String? estado;
  String? id;
  String? nombre;
  String? codigo;
  Facultad? facultad;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  int? v;

  factory Materia.fromJson(Map<String, dynamic> json) => Materia(
        estado: json["estado"],
        id: json["_id"],
        nombre: json["nombre"],
        codigo: json["codigo"],
        facultad: json['facultad'] != null
            ? new Facultad.fromJson(json['facultad'].runtimeType == String
                ? {"id": json['facultad']}
                : json['facultad'])
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
        "estado": estado,
        "_id": id,
        "nombre": nombre,
        "codigo": codigo,
        "facultad": facultad?.toJson(),
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "__v": v,
      };
}
