import 'package:json_annotation/json_annotation.dart';
import 'package:tmsgraduatework/src/model.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel extends Model{
  final String image;
  final String title;
  final double rating;
  final int voters;
  final String teacher;
  final String label;
  @JsonKey(includeFromJson: false)
  int type = 0;

  CourseModel({required this.image, required this.title, required this.rating, required this.voters, required this.teacher, required this.label});

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);
}