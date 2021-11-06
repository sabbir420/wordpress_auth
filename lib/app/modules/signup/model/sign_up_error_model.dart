// To parse this JSON data, do
//
//     final signupErrorModel = signupErrorModelFromJson(jsonString);

import 'dart:convert';

SignupErrorModel signupErrorModelFromJson(String str) => SignupErrorModel.fromJson(json.decode(str));

String signupErrorModelToJson(SignupErrorModel data) => json.encode(data.toJson());

class SignupErrorModel {
    SignupErrorModel({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    Data data;

    factory SignupErrorModel.fromJson(Map<String, dynamic> json) => SignupErrorModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.status,
    });

    int status;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
