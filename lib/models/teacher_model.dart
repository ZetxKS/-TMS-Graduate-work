import 'package:json_annotation/json_annotation.dart';
import 'package:tmsgraduatework/src/model.dart';

part 'teacher_model.g.dart';

@JsonSerializable()
class TeacherModel extends Model {
  final String avatar;
  final String name;
  final String nickname;
  final bool followed;
  TeacherModel({required this.avatar, required this.name, required this.nickname, required this.followed});
  factory TeacherModel.fromJson(Map<String, dynamic> json) => _$TeacherModelFromJson(json);
}