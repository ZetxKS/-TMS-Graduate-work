import 'package:json_annotation/json_annotation.dart';
import 'package:tmsgraduatework/src/model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Model {
  final String image;
  final String name;

  CategoryModel({required this.image, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
