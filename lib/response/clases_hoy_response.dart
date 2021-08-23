// To parse this JSON data, do
//
//     final claseHoyResponse = claseHoyResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_control_ayudante/models/clase_model.dart';

ClaseHoyResponse claseHoyResponseFromJson(String str) =>
    ClaseHoyResponse.fromJson(json.decode(str));

String claseHoyResponseToJson(ClaseHoyResponse data) =>
    json.encode(data.toJson());

class ClaseHoyResponse {
  ClaseHoyResponse({this.ok, this.clases, this.msg});

  bool? ok;
  List<Clase>? clases;
  String? msg;

  factory ClaseHoyResponse.fromJson(Map<String, dynamic> json) =>
      ClaseHoyResponse(
        ok: json["ok"],
        clases: List<Clase>.from(json["clases"].map((x) => Clase.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "clases": (this.clases != null)
            ? List<dynamic>.from(clases!.map((x) => x.toJson()))
            : [],
        "msg": msg,
      };
}
