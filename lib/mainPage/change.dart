import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HabitData {
  final int modifiedTime;
  final String hid;
  final String uid;
  final String name;
  final String target;
  final String encourageSentence;
  final String startDate;
  final int preTime;
  final int consistDay;
  final int completeDay;
  final String icon;
  final String statement;
  final bool isDefault;
  final int processingDay;
  final int createTime;
  final String createUser;

  HabitData({
    required this.modifiedTime,
    required this.hid,
    required this.uid,
    required this.name,
    required this.target,
    required this.encourageSentence,
    required this.startDate,
    required this.preTime,
    required this.consistDay,
    required this.completeDay,
    required this.icon,
    required this.statement,
    required this.isDefault,
    required this.processingDay,
    required this.createTime,
    required this.createUser,
  });

  factory HabitData.fromJson(Map<String, dynamic> json) {
    return HabitData(
      modifiedTime: json['modifiedTime'],
      hid: json['hid'],
      uid: json['uid'],
      name: json['name'],
      target: json['target'],
      encourageSentence: json['encourageSentence'],
      startDate: json['startDate'],
      preTime: json['preTime'],
      consistDay: json['consistDay'],
      completeDay: json['completeDay'],
      icon: json['icon'],
      statement: json['statement'],
      isDefault: json['isDefault'],
      processingDay: json['processingDay'],
      createTime: json['createTime'],
      createUser: json['createUser'],
    );
  }
}

class DataManager {
  static final DataManager _singleton = DataManager._internal();

  factory DataManager() {
    return _singleton;
  }

  DataManager._internal() : habits = [], username = '';

  String username;
  List<HabitData> habits;

  Future<List<HabitData>> getData(String username) async {
    final response = await http.get(('http://8.130.41.221:8081/habit/userAllHabit?username=%22' + username + '%22') as Uri);
    final List<dynamic> jsonArray = json.decode(response.body);
    habits = jsonArray.map((habitJson) => HabitData.fromJson(habitJson)).toList();
    return habits;
  }
}
