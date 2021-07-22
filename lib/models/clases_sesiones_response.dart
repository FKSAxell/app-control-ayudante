// To parse this JSON data, do
//
//     final clasesPorSesionesResponse = clasesPorSesionesResponseFromJson(jsonString);

import 'dart:convert';

import 'ayudantia.dart';

ClasesPorSesionesResponse clasesPorSesionesResponseFromJson(String str) =>
    ClasesPorSesionesResponse.fromJson(json.decode(str));

String clasesPorSesionesResponseToJson(ClasesPorSesionesResponse data) =>
    json.encode(data.toJson());

class ClasesPorSesionesResponse {
  ClasesPorSesionesResponse({required this.ok, this.sesiones, this.msg});

  bool ok;
  List<Sesiones>? sesiones;
  String? msg;

  factory ClasesPorSesionesResponse.fromJson(Map<String, dynamic> json) =>
      ClasesPorSesionesResponse(
        ok: json["ok"],
        sesiones: List<Sesiones>.from(
            json["sesiones"].map((x) => Sesiones.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "sesiones": (this.sesiones != null)
            ? List<dynamic>.from(sesiones!.map((x) => x.toJson()))
            : []
      };
}

class Sesiones {
  Sesiones({
    required this.id,
    required this.sesion,
  });

  int id;
  List<Sesion> sesion;

  factory Sesiones.fromJson(Map<String, dynamic> json) => Sesiones(
        id: json["_id"],
        sesion:
            List<Sesion>.from(json["sesion"].map((x) => Sesion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sesion": List<dynamic>.from(sesion.map((x) => x.toJson())),
      };
}

class Sesion {
  Sesion({
    required this.id,
    required this.estado,
    required this.ayudantia,
    required this.horaInicio,
    required this.minutoInicio,
    required this.horaFin,
    required this.minutoFin,
    required this.dia,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
    required this.clase,
    required this.favorito,
  });

  String id;
  String estado;
  Ayudantia ayudantia;
  int horaInicio;
  int minutoInicio;
  int horaFin;
  int minutoFin;
  int dia;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;
  Clase clase;
  Favorito favorito;

  factory Sesion.fromJson(Map<String, dynamic> json) => Sesion(
        id: json["_id"],
        estado: json["estado"],
        ayudantia: Ayudantia.fromJson(json["ayudantia"]),
        horaInicio: json["horaInicio"],
        minutoInicio: json["minutoInicio"],
        horaFin: json["horaFin"],
        minutoFin: json["minutoFin"],
        dia: json["dia"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        v: json["__v"],
        clase: Clase.fromJson(json["clase"]),
        favorito: Favorito.fromJson(json["favorito"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "ayudantia": ayudantia.toJson(),
        "horaInicio": horaInicio,
        "minutoInicio": minutoInicio,
        "horaFin": horaFin,
        "minutoFin": minutoFin,
        "dia": dia,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v,
        "clase": clase.toJson(),
        "favorito": favorito.toJson(),
      };
}

class Clase {
  Clase({
    required this.id,
    required this.estado,
    required this.sesion,
    required this.tema,
    required this.descripcion,
    required this.enlace,
    required this.ubicacion,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
    required this.fechaClase,
  });

  String id;
  String estado;
  String sesion;
  String tema;
  String descripcion;
  String enlace;
  String ubicacion;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;
  DateTime fechaClase;

  factory Clase.fromJson(Map<String, dynamic> json) => Clase(
        id: json["_id"],
        estado: json["estado"],
        sesion: json["sesion"],
        tema: json["tema"],
        descripcion: json["descripcion"],
        enlace: json["enlace"],
        ubicacion: json["ubicacion"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        v: json["__v"],
        fechaClase: DateTime.parse(json["fechaClase"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "sesion": sesion,
        "tema": tema,
        "descripcion": descripcion,
        "enlace": enlace,
        "ubicacion": ubicacion,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v,
        "fechaClase": fechaClase.toIso8601String(),
      };
}

class Favorito {
  Favorito({
    required this.id,
    required this.estado,
    required this.usuario,
    required this.sesion,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
  });

  String id;
  String estado;
  String usuario;
  String sesion;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;

  factory Favorito.fromJson(Map<String, dynamic> json) => Favorito(
        id: json["_id"],
        estado: json["estado"],
        usuario: json["usuario"],
        sesion: json["sesion"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "usuario": usuario,
        "sesion": sesion,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v,
      };
}
