// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) => TeacherModel(
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      followed: json['followed'] as bool,
    );

Map<String, dynamic> _$TeacherModelToJson(TeacherModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'name': instance.name,
      'nickname': instance.nickname,
      'followed': instance.followed,
    };
