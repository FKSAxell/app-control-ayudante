import 'dart:convert';

import 'package:app_control_ayudante/models/facultad_model.dart';

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
  List<Facultad> facultades;

  factory MateriasPorFacultadResponse.fromJson(Map<String, dynamic> json) =>
      MateriasPorFacultadResponse(
        ok: json["ok"],
        facultades: List<Facultad>.from(
            json["facultades"].map((x) => Facultad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "facultades": List<dynamic>.from(facultades.map((x) => x.toJson())),
      };
}
