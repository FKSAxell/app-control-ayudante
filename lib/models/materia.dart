import 'dart:convert';

import 'facultad.dart';

Materia materiaFromJson(String str) => Materia.fromJson(json.decode(str));
String materiaToJson(Materia data) => json.encode(data.toJson());

class Materia {
  Materia({
    required this.estado,
    required this.id,
    required this.nombre,
    required this.codigo,
    required this.facultad,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
  });

  String estado;
  String id;
  String nombre;
  String codigo;
  Facultad facultad;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;

  factory Materia.fromJson(Map<String, dynamic> json) => Materia(
        estado: json["estado"],
        id: json["_id"],
        nombre: json["nombre"],
        codigo: json["codigo"],
        facultad: Facultad.fromJson(json["facultad"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "nombre": nombre,
        "codigo": codigo,
        "facultad": facultad.toJson(),
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v,
      };
}
