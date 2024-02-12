// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String emailid;
  String password;

  PostModel({
    required this.emailid,
    required this.password,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    emailid: json["EMAILID"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "EMAILID": emailid,
    "password": password,
  };
}
