import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String name;
  String email;
  String uid;
  String dob;
  String gender;
  String password;
  String? photo;

  User({
    required this.name,
    required this.email,
    required this.uid,
    required this.dob,
    required this.gender,
    required this.password,
    this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    uid: json["uid"],
    dob: json["dob"],
    gender: json["gender"],
    password: json["password"],
    photo: json["photo"] ?? "assets/images/Image.png",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "uid": uid,
    "dob": dob,
    "gender": gender,
    "password": password,
    "photo": photo,
  };
}