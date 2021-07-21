import 'dart:convert';
import 'facultad.dart';

Carrera carreraFromJson(String str) => Carrera.fromJson(json.decode(str));
String carreraToJson(Carrera data) => json.encode(data.toJson());

class Carrera {
  Carrera({
    required this.estado,
    required this.id,
    required this.facultad,
    required this.nombre,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
  });

  String estado;
  String id;
  Facultad facultad;
  String nombre;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;

  factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
      estado: json["estado"],
      id: json["_id"],
      facultad: Facultad.fromJson(json["facultad"]),
      nombre: json["nombre"],
      fechaCreacion: DateTime.parse(json["fechaCreacion"]),
      fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
      v: json["__v"]);

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "facultad": facultad.toJson(),
        "nombre": nombre,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v
      };
}
