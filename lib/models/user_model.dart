import 'package:json_annotation/json_annotation.dart';
import 'package:tmsgraduatework/src/model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Model {
  final String avatar;
  final String name;
  final String nickname;
  final List<String> projects;

  UserModel({
    required this.avatar,
    required this.name,
    required this.nickname,
    required this.projects,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json['user']);
}
