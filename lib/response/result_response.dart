// To parse this JSON data, do
//
//     final resultResponse = resultResponseFromJson(jsonString);

import 'dart:convert';

ResultResponse resultResponseFromJson(String str) =>
    ResultResponse.fromJson(json.decode(str));

String resultResponseToJson(ResultResponse data) => json.encode(data.toJson());

class ResultResponse {
  ResultResponse({
    required this.ok,
    required this.result,
  });

  bool ok;
  bool result;

  factory ResultResponse.fromJson(Map<String, dynamic> json) => ResultResponse(
        ok: json["ok"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "result": result,
      };
}
