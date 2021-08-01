import 'dart:convert';

Clase materiaFromJson(String str) => Clase.fromJson(json.decode(str));
String materiaToJson(Clase data) => json.encode(data.toJson());

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
