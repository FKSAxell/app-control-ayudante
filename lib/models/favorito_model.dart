import 'dart:convert';

Favorito materiaFromJson(String str) => Favorito.fromJson(json.decode(str));
String materiaToJson(Favorito data) => json.encode(data.toJson());

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
