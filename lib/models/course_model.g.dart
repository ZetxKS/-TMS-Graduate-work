// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      image: json['image'] as String,
      title: json['title'] as String,
      rating: (json['rating'] as num).toDouble(),
      voters: json['voters'] as int,
      teacher: json['teacher'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'rating': instance.rating,
      'voters': instance.voters,
      'teacher': instance.teacher,
      'label': instance.label,
    };
