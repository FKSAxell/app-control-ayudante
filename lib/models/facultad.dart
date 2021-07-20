import 'dart:convert';

Facultad facultadFromJson(String str) => Facultad.fromJson(json.decode(str));

String facultadToJson(Facultad data) => json.encode(data.toJson());

class Facultad {
  Facultad({
    required this.estado,
    required this.id,
    required this.nombre,
    required this.codigo,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
  });

  String estado;
  String id;
  String nombre;
  String codigo;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;

  factory Facultad.fromJson(Map<String, dynamic> json) => Facultad(
        estado: json["estado"],
        id: json["_id"],
        nombre: json["nombre"],
        codigo: json["codigo"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "nombre": nombre,
        "codigo": codigo,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v,
      };
}
