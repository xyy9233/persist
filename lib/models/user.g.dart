// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..user_id = json['user_id'] as num
  ..phone = json['phone'] as String
  ..email = json['email'] as String
  ..user_name = json['user_name'] as String
  ..user_pwd = json['user_pwd'] as String
  ..habit_id = json['habit_id'] as num
  ..target = json['target'] as String
  ..consist_day = json['consist_day'] as num
  ..complete_day = json['complete_day'] as num
  ..avatar = json['avatar'] as String
  ..sound = json['sound'] as String
  ..statement = json['statement'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'phone': instance.phone,
      'email': instance.email,
      'user_name': instance.user_name,
      'user_pwd': instance.user_pwd,
      'habit_id': instance.habit_id,
      'target': instance.target,
      'consist_day': instance.consist_day,
      'complete_day': instance.complete_day,
      'avatar': instance.avatar,
      'sound': instance.sound,
      'statement': instance.statement,
    };
