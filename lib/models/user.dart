// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.state,
    required this.message,
    required this.data,
  });

  int state;
  String message;
  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    state: json["state"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.modifiedUser,
    this.modifiedTime,
    required this.uid,
    required this.username,
    this.password,
    this.salt,
    this.phone,
    this.email,
    this.gender,
    this.avatar,
    this.isDelete,
    required this.achievement1,
    required this.achievement2,
    required this.achievement3,
    required this.achievement4,
    this.createUser,
    this.createTime,
  });

  dynamic modifiedUser;
  dynamic modifiedTime;
  int uid;
  String username;
  dynamic password;
  dynamic salt;
  dynamic phone;
  dynamic email;
  dynamic gender;
  dynamic avatar;
  dynamic isDelete;
  bool achievement1;
  bool achievement2;
  bool achievement3;
  bool achievement4;
  dynamic createUser;
  dynamic createTime;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    modifiedUser: json["modifiedUser"],
    modifiedTime: json["modifiedTime"],
    uid: json["uid"],
    username: json["username"],
    password: json["password"],
    salt: json["salt"],
    phone: json["phone"],
    email: json["email"],
    gender: json["gender"],
    avatar: json["avatar"],
    isDelete: json["isDelete"],
    achievement1: json["achievement1"],
    achievement2: json["achievement2"],
    achievement3: json["achievement3"],
    achievement4: json["achievement4"],
    createUser: json["createUser"],
    createTime: json["createTime"],
  );

  Map<String, dynamic> toJson() => {
    "modifiedUser": modifiedUser,
    "modifiedTime": modifiedTime,
    "uid": uid,
    "username": username,
    "password": password,
    "salt": salt,
    "phone": phone,
    "email": email,
    "gender": gender,
    "avatar": avatar,
    "isDelete": isDelete,
    "achievement1": achievement1,
    "achievement2": achievement2,
    "achievement3": achievement3,
    "achievement4": achievement4,
    "createUser": createUser,
    "createTime": createTime,
  };
}
