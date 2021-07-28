// To parse this JSON data, do
//
//     final ayudantesPorMateriaResponse = ayudantesPorMateriaResponseFromJson(jsonString);

import 'dart:convert';

AyudantesPorMateriaResponse ayudantesPorMateriaResponseFromJson(String str) =>
    AyudantesPorMateriaResponse.fromJson(json.decode(str));

String ayudantesPorMateriaResponseToJson(AyudantesPorMateriaResponse data) =>
    json.encode(data.toJson());

class AyudantesPorMateriaResponse {
  AyudantesPorMateriaResponse({
    required this.ok,
    required this.ayudantes,
  });

  bool ok;
  List<Ayudante> ayudantes;

  factory AyudantesPorMateriaResponse.fromJson(Map<String, dynamic> json) =>
      AyudantesPorMateriaResponse(
        ok: json["ok"],
        ayudantes: List<Ayudante>.from(
            json["ayudantes"].map((x) => Ayudante.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "ayudantes": List<dynamic>.from(ayudantes.map((x) => x.toJson())),
      };
}

class Ayudante {
  Ayudante({
    required this.id,
    this.avg,
    required this.estado,
    required this.fechaInicio,
    required this.fechaFin,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
    required this.sesion,
    required this.usuario,
    required this.materia,
  });

  Id id;
  double? avg;
  String estado;
  DateTime fechaInicio;
  DateTime fechaFin;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;
  List<Sesion> sesion;
  Usuario usuario;
  Materia materia;

  factory Ayudante.fromJson(Map<String, dynamic> json) => Ayudante(
        id: Id.fromJson(json["_id"]),
        avg: json["avg"] == null ? null : json["avg"].toDouble(),
        estado: json["estado"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        v: json["__v"],
        sesion:
            List<Sesion>.from(json["sesion"].map((x) => Sesion.fromJson(x))),
        usuario: Usuario.fromJson(json["usuario"]),
        materia: Materia.fromJson(json["materia"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "avg": avg,
        "estado": estado,
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaFin": fechaFin.toIso8601String(),
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v,
        "sesion": List<dynamic>.from(sesion.map((x) => x.toJson())),
        "usuario": usuario.toJson(),
        "materia": materia.toJson(),
      };
}

class Id {
  Id({
    required this.ayudantia,
  });

  String ayudantia;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        ayudantia: json["ayudantia"],
      );

  Map<String, dynamic> toJson() => {
        "ayudantia": ayudantia,
      };
}

class Materia {
  Materia({
    required this.id,
    required this.estado,
    required this.nombre,
    required this.codigo,
    required this.facultad,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
  });

  String id;
  String estado;
  String nombre;
  String codigo;
  String facultad;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;

  factory Materia.fromJson(Map<String, dynamic> json) => Materia(
        id: json["_id"],
        estado: json["estado"],
        nombre: json["nombre"],
        codigo: json["codigo"],
        facultad: json["facultad"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "nombre": nombre,
        "codigo": codigo,
        "facultad": facultad,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v,
      };
}

class Sesion {
  Sesion({
    required this.horaInicio,
    required this.minutoInicio,
    required this.horaFin,
    required this.minutoFin,
    required this.dia,
  });

  int? horaInicio;
  int? minutoInicio;
  int? horaFin;
  int? minutoFin;
  int? dia;

  factory Sesion.fromJson(Map<String, dynamic> json) => Sesion(
        horaInicio: json["horaInicio"] == null ? null : json["horaInicio"],
        minutoInicio:
            json["minutoInicio"] == null ? null : json["minutoInicio"],
        horaFin: json["horaFin"] == null ? null : json["horaFin"],
        minutoFin: json["minutoFin"] == null ? null : json["minutoFin"],
        dia: json["dia"] == null ? null : json["dia"],
      );

  Map<String, dynamic> toJson() => {
        "horaInicio": horaInicio,
        "minutoInicio": minutoInicio,
        "horaFin": horaFin,
        "minutoFin": minutoFin,
        "dia": dia,
      };
}

class Usuario {
  Usuario({
    required this.nombre,
    required this.email,
    required this.estado,
  });

  String nombre;
  String email;
  String estado;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        email: json["email"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "email": email,
        "estado": estado,
      };
}
