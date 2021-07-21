import 'dart:convert';

import 'carrera.dart';
import 'rol.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.rol,
    required this.estado,
    required this.nombre,
    required this.email,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.tokenFcm,
    this.carrera,
    required this.uid,
  });

  List<Rol> rol;
  String estado;
  String nombre;
  String email;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  String? tokenFcm;
  Carrera? carrera;
  String uid;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        rol: List<Rol>.from(json["rol"].map((x) => Rol.fromJson(x))),
        estado: json["estado"],
        nombre: json["nombre"],
        email: json["email"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        tokenFcm: json["tokenFCM"],
        carrera: json['carrera'] != null
            ? new Carrera.fromJson(json['carrera'])
            : null,
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "rol": List<dynamic>.from(rol.map((x) => x.toJson())),
        "estado": estado,
        "nombre": nombre,
        "email": email,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "tokenFCM": tokenFcm,
        "carrera": carrera?.toJson(),
        "uid": uid,
      };
}
