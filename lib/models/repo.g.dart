// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo()
  ..user_id = json['user_id'] as num
  ..phone = json['phone'] as String
  ..email = json['email'] as String
  ..username = json['username'] as String
  ..password = json['password'] as String
  ..habit_id = json['habit_id'] as num
  ..target = json['target'] as String
  ..consist_day = json['consist_day'] as num
  ..complete_day = json['complete_day'] as num
  ..avatar = json['avatar'] as String
  ..sound = json['sound'] as String
  ..statement = json['statement'] as String;

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'phone': instance.phone,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'habit_id': instance.habit_id,
      'target': instance.target,
      'consist_day': instance.consist_day,
      'complete_day': instance.complete_day,
      'avatar': instance.avatar,
      'sound': instance.sound,
      'statement': instance.statement,
    };
