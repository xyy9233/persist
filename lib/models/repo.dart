import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable()
class Repo {
  Repo();

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
  
  factory Repo.fromJson(Map<String,dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
