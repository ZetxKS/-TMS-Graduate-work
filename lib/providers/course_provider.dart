import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/src/api.dart';

class CourseProvider {
  Database? db;

  Future<void> _getInstanse() async {
    if (db == null) {
      try {
        db = await openDatabase(
          'saved.db',
          version: 3,
          onCreate: (dbl, integ) async {
            await dbl.execute('CREATE TABLE "saved_courses" ('
                '"image" TEXT NOT NULL,'
                '"rating" REAL NOT NULL,'
                '"teacher" TEXT NOT NULL,'
                '"label" TEXT NOT NULL,'
                '"voters" INTEGER NOT NULL,'
                '"title" TEXT NOT NULL,'
                'UNIQUE("title") ON CONFLICT REPLACE'
                ')'
                ';');
          },
        );
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> saveCourse(CourseModel model) async {
    await _getInstanse();
    try {
      int id = await db!.insert('saved_courses', model.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> delCourse(CourseModel model) async {
    await _getInstanse();
    try {
      await db!.delete("saved_courses",
          where: "title = ?", whereArgs: [model.title]);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<CourseModel>> getLocalCourses() async {
    await _getInstanse();
    List<CourseModel> models = [];
    try {
      List<Map<String, dynamic>> result =
          await db!.rawQuery("SELECT * FROM saved_courses");
      models = result.map((e) => CourseModel.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    }
    return models;
  }

  Future<List<CourseModel>> getCourses() async {
    final json = await Api.get('courses');
    List<dynamic> previous = json['courses']['previousClass'];
    List<dynamic> others = json['courses']['others'];
    List<dynamic> mostPopular = json['courses']['mostPopular'];
    previous = previous.map((e) {
      CourseModel tmp = CourseModel.fromJson(e);
      return tmp..type = 1;
    }).toList();
    others = others.map((e) {
      CourseModel tmp = CourseModel.fromJson(e);
      return tmp..type = 2;
    }).toList();
    mostPopular = mostPopular.map((e) {
      CourseModel tmp = CourseModel.fromJson(e);
      return tmp..type = 3;
    }).toList();
    List<CourseModel> list = (previous as List<CourseModel>) +
        (others as List<CourseModel>) +
        (mostPopular as List<CourseModel>);
    return list;
  }
}
