// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      projects:
          (json['projects'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'name': instance.name,
      'nickname': instance.nickname,
      'projects': instance.projects,
    };
