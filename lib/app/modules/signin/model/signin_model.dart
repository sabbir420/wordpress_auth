// To parse this JSON data, do
//
//     final signinModel = signinModelFromJson(jsonString);

import 'dart:convert';

SigninModel signinModelFromJson(String str) => SigninModel.fromJson(json.decode(str));

String signinModelToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
    SigninModel({
        this.token,
        this.userEmail,
        this.userNicename,
        this.userDisplayName,
    });

    dynamic token;
    dynamic userEmail;
    dynamic userNicename;
    dynamic userDisplayName;

    factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
    };
}
