// To parse this JSON data, do
//
//     final habit = habitFromJson(jsonString);

import 'dart:convert';

Habit habitFromJson(String str) => Habit.fromJson(json.decode(str));

String habitToJson(Habit data) => json.encode(data.toJson());

class Habit {
  Habit({
    required this.state,
    required this.message,
    required this.data,
    required this.uid,
  });

  int state;
  String message;
  List<Datum> data;
  int uid;

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
    state: json["state"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "uid": uid,
  };
}

class Datum {
  Datum({
    required this.modifiedUser,
    required this.modifiedTime,
    required this.hid,
    required this.uid,
    required this.name,
    required this.target,
    required this.encourageSentence,
    this.startDate,
    required this.preTime,
    required this.consistDay,
    required this.completeDay,
    required this.icon,
    required this.statement,
    required this.isDefault,
    required this.processingDay,
    required this.createUser,
    required this.createTime,
  });

  String modifiedUser;
  String modifiedTime;
  int hid;
  int uid;
  String name;
  int target;
  String encourageSentence;
  DateTime? startDate;
  String preTime;
  int consistDay;
  int completeDay;
  String icon;
  int statement;
  int isDefault;
  int processingDay;
  String createUser;
  String createTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    modifiedUser: json["modifiedUser"],
    modifiedTime: json["modifiedTime"],
    hid: json["hid"],
    uid: json["uid"],
    name: json["name"],
    target: json["target"],
    encourageSentence: json["encourage_sentence"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    preTime: json["pre_time"],
    consistDay: json["consist_day"],
    completeDay: json["complete_day"],
    icon: json["icon"],
    statement: json["statement"],
    isDefault: json["is_default"],
    processingDay: json["processing_day"],
    createUser: json["createUser"],
    createTime: json["createTime"],
  );

  Map<String, dynamic> toJson() => {
    "modifiedUser": modifiedUser,
    "modifiedTime": modifiedTime,
    "hid": hid,
    "uid": uid,
    "name": name,
    "target": target,
    "encourage_sentence": encourageSentence,
    "start_date": startDate?.toIso8601String(),
    "pre_time": preTime,
    "consist_day": consistDay,
    "complete_day": completeDay,
    "icon": icon,
    "statement": statement,
    "is_default": isDefault,
    "processing_day": processingDay,
    "createUser": createUser,
    "createTime": createTime,
  };
}
