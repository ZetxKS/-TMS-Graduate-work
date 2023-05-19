import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tmsgraduatework/models/category_model.dart';

class CategoryProvider {
  final _dio = Dio(
    BaseOptions(
        baseUrl:
            "https://raw.githubusercontent.com/alex-shinkevich/tms_api/main/project-5/"),
  );

  Future<List<CategoryModel>> getCategoryes() async {
    final res = await _dio.get<String>('categories.json');
    List<dynamic> json = jsonDecode(res.data!)['categories'];
    return json.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
