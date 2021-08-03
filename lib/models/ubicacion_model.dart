import 'dart:convert';

Ubicacion materiaFromJson(String str) => Ubicacion.fromJson(json.decode(str));
String materiaToJson(Ubicacion data) => json.encode(data.toJson());

class Ubicacion {
  Ubicacion({
    this.id,
    this.estado,
    this.nombre,
    this.codigo,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.v,
  });

  String? id;
  String? estado;
  String? nombre;
  String? codigo;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  int? v;

  factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        id: json["_id"],
        estado: json["estado"],
        nombre: json["nombre"],
        codigo: json["codigo"],
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
        "nombre": nombre,
        "codigo": codigo,
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "__v": v,
      };
}
