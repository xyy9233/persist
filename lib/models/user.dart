import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late num user_id;
  late String phone;
  late String email;
  late String username;
  late String password;
  late num habit_id;
  late String target;
  late num consist_day;
  late num complete_day;
  late String avatar;
  late String sound;
  late String statement;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
