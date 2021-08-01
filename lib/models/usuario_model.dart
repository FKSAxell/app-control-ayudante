import 'dart:convert';

import 'carrera_model.dart';
import 'rol_model.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.rol,
    this.estado,
    this.nombre,
    this.email,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.tokenFcm,
    this.carrera,
    this.id,
  });

  String? id;
  List<Rol>? rol;
  String? nombre;
  String? email;
  String? tokenFcm;
  Carrera? carrera;
  String? estado;
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        rol: json["rol"] != null
            ? List<Rol>.from(json["rol"].map(
                (x) => x != null
                    ? new Rol.fromJson(x.runtimeType == String ? {"id": x} : x)
                    : null,
              ))
            : [],
        estado: json["estado"],
        nombre: json["nombre"],
        email: json["email"],
        tokenFcm: json["tokenFCM"],
        carrera: json['carrera'] != null
            ? new Carrera.fromJson(json['carrera'].runtimeType == String
                ? {"id": json['carrera']}
                : json['carrera'])
            : null,
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"])
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "rol": rol != null
            ? List<dynamic>.from(rol!.map((x) => x.toJson()))
            : null,
        "estado": estado,
        "nombre": nombre,
        "email": email,
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "fechaActualizacion": fechaActualizacion?.toIso8601String(),
        "tokenFCM": tokenFcm,
        "carrera": carrera?.toJson(),
        "_id": id,
      };
}
