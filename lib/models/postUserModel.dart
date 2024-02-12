// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String userId;
  String post;

  PostModel({
    required this.userId,
    required this.post,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    userId: json["userId"],
    post: json["post"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "post": post,
  };
}
