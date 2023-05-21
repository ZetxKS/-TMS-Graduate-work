import 'package:dio/dio.dart';
import 'dart:convert';

class Api {
  static final _dio = Dio(
    BaseOptions(
        baseUrl:
            "https://raw.githubusercontent.com/alex-shinkevich/tms_api/main/project-5/"),
  );

  static Future<Map<String,dynamic>> get(String method) async {
    final res = await _dio.get<String>('$method.json');
    return jsonDecode(res.data!);
  }
}