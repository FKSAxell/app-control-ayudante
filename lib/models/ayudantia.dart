import 'materia.dart';
import 'usuario.dart';

class Ayudantia {
  Ayudantia({
    required this.id,
    required this.estado,
    required this.usuario,
    required this.materia,
    required this.fechaInicio,
    required this.fechaFin,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
  });

  String id;
  String estado;
  Usuario usuario;
  Materia materia;
  DateTime fechaInicio;
  DateTime fechaFin;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;

  factory Ayudantia.fromJson(Map<String, dynamic> json) => Ayudantia(
        id: json["_id"],
        estado: json["estado"],
        usuario: Usuario.fromJson(json["usuario"]),
        materia: Materia.fromJson(json["materia"]),
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "usuario": usuario.toJson(),
        "materia": materia.toJson(),
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaFin": fechaFin.toIso8601String(),
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v,
      };
}
