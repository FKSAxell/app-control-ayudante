import 'dart:convert';

MateriasPorFacultadResponse materiasPorFacultadResponseFromJson(String str) =>
    MateriasPorFacultadResponse.fromJson(json.decode(str));

String materiasPorFacultadResponseToJson(MateriasPorFacultadResponse data) =>
    json.encode(data.toJson());

class MateriasPorFacultadResponse {
  MateriasPorFacultadResponse({
    required this.ok,
    required this.facultades,
  });

  bool ok;
  List<Facultade> facultades;

  factory MateriasPorFacultadResponse.fromJson(Map<String, dynamic> json) =>
      MateriasPorFacultadResponse(
        ok: json["ok"],
        facultades: List<Facultade>.from(
            json["facultades"].map((x) => Facultade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "facultades": List<dynamic>.from(facultades.map((x) => x.toJson())),
      };
}

class Facultade {
  Facultade({
    required this.id,
    required this.estado,
    required this.nombre,
    required this.codigo,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.v,
    required this.materia,
  });

  String id;
  String estado;
  String nombre;
  String codigo;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  int v;
  List<Materia> materia;

  factory Facultade.fromJson(Map<String, dynamic> json) => Facultade(
        id: json["_id"],
        estado: json["estado"],
        nombre: json["nombre"],
        codigo: json["codigo"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        v: json["__v"],
        materia:
            List<Materia>.from(json["materia"].map((x) => Materia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "estado": estado,
        "nombre": nombre,
        "codigo": codigo,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "__v": v,
        "materia": List<dynamic>.from(materia.map((x) => x.toJson())),
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
