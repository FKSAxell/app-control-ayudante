import 'dart:convert';

import 'package:app_control_ayudante/models/usuario_model.dart';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.ok,
    this.usuario,
    this.token,
    this.msg,
  });

  bool? ok;
  Usuario? usuario;
  String? token;
  String? msg;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario!.toJson(),
        "token": token,
        "msg": msg,
      };
}
