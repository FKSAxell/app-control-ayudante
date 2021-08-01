import 'dart:convert';
import 'facultad_model.dart';

Carrera carreraFromJson(String str) => Carrera.fromJson(json.decode(str));
String carreraToJson(Carrera data) => json.encode(data.toJson());

class Carrera {
  Carrera({
    this.estado,
    this.id,
    this.facultad,
    this.nombre,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.v,
  });

  String? estado;
  String? id;
  Facultad? facultad;
  String? nombre;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  int? v;

  factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
      id: json["_id"],
      facultad: json['facultad'] != null
          ? new Facultad.fromJson(json['facultad'].runtimeType == String
              ? {"id": json['facultad']}
              : json['facultad'])
          : null,
      nombre: json["nombre"],
      estado: json["estado"],
      fechaCreacion: json["fechaCreacion"] != null
          ? DateTime.parse(json["fechaCreacion"])
          : null,
      fechaActualizacion: json["fechaActualizacion"] != null
          ? DateTime.parse(json["fechaActualizacion"])
          : null,
      v: json["__v"]);

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "facultad": facultad?.toJson(),
        "nombre": nombre,
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "__v": v
      };
}
