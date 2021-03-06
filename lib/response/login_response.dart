import 'dart:convert';

import 'package:app_control_ayudante/models/usuario_model.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.ok,
    this.usuario,
    this.token,
    this.msg,
  });

  bool? ok;
  Usuario? usuario;
  String? token;
  String? msg;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
