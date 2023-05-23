import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/src/api.dart';

class CourseProvider {
  Database? db;

  Future<void> _getInstanse() async {
    if (db != null) {
      try {
        db = await openDatabase('saved.db', version: 3, onCreate: (dbl, integ) async {
          await dbl.execute('create table saved_courses'
            '('
              'id      integer'
              'constraint saved_courses_pk'
              'primary key,'
              'image   text    not null,'
              'rating  REAL    not null,'
              'teacher TEXT    not null,'
              'label   text    not null,'
              'voters  integer not null,'
              'title   text'
              'constraint saved_courses_pk'
              'unique'
          ');');
        });
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
      int rows = await db!.delete("saved_courses", where: "title = ?", whereArgs: [model.title]);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<CourseModel>> getLocalCourses() async {
    await _getInstanse();
    List<CourseModel> models = [];
    try {
      List<Map<String, dynamic>> result = await db!.rawQuery("SELECT * FROM saved_courses");
      print(result);
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
