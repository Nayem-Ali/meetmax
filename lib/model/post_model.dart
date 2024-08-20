// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  int id;
  String author;
  String avatar;
  String time;
  String visibility;
  String? caption;
  List<String>? media;
  List<String>? likes;
  List<PostComment>? comments;
  int? share;

  Post({
    required this.id,
    required this.author,
    required this.avatar,
    required this.time,
    required this.visibility,
    this.caption,
    this.media,
    this.likes,
    this.comments,
    this.share,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        author: json["author"],
        avatar: json["avatar"],
        time: json["time"],
        visibility: json["visibility"],
        caption: json["caption"] ?? "",
        media: List<String>.from(json["media"].map((x) => x)),
        likes: List<String>.from(json["likes"].map((x) => x)),
        comments: List<PostComment>.from(json["comments"].map((x) => PostComment.fromJson(x))),
        share: json["share"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "avatar": avatar,
        "time": time,
        "visibility": visibility,
        "caption": caption,
        "media": media!.isEmpty ? [] : List<dynamic>.from(media!.map((x) => x)),
        "likes": likes!.isEmpty ? [] : List<dynamic>.from(likes!.map((x) => x)),
        "comments": comments!.isEmpty ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "share": share! > 0 ? share : 0,
      };
}

class PostComment {
  String name;
  String avatar;
  String time;
  String text;
  List<dynamic>? media;
  int? like;
  List<PostComment>? reply;

  PostComment({
    required this.name,
    required this.avatar,
    required this.time,
    required this.text,
    required this.media,
    required this.like,
    required this.reply,
  });

  factory PostComment.fromJson(Map<String, dynamic> json) => PostComment(
        name: json["name"],
        avatar: json["avatar"],
        time: json["time"],
        text: json["text"] ?? "",
        media: List<dynamic>.from(json["media"].map((x) => x)),
        like: json["like"] ?? 0,
        reply: List<PostComment>.from(json["reply"].map((x) => PostComment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "time": time,
        "text": text,
        "media": List<dynamic>.from(media!.map((x) => x)),
        "like": like,
        "reply": List<dynamic>.from(reply!.map((x) => x.toJson())),
      };
}
