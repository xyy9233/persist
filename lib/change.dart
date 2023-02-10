import 'dart:convert';

class Habits {
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


  Habits.fromJson(Map<String, dynamic> json)
      : this.modifiedTime = json['modifiedTime'],
        this.hid = json['hid'],
        this.uid = json['uid'],
        this.name = json['name'],
        this.target = json['target'],
        this.encourageSentence = json['encourage_sentence'],
        this.startDate = json['start_date'],
        this.preTime = json['pre_time'],
        this.consistDay = json['consist_day'],
        this.completeDay = json['complete_day'],
        this.icon = json['icon'],
        this.statement = json['statement'],
        this.isDefault = json['is_default'],
        this.processingDay = json['processing_day'],
        this.createTime = json['createTime'],
        this.createUser = json['createUser'];
}

