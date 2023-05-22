import 'package:sqflite/sqflite.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/src/api.dart';

class CourseProvider {
  static Future<Database> _getInstanse() async {
    Database db = await openDatabase('saved.db');
    await db.execute("create table if not exists saved_courses (id integer not null constraint saved_courses_pk primary key autoincrement, json text not null, name integer not null constraint saved_courses_pk unique);");
    return db;
  }

  static void saveCourse(CourseModel model) async {
    Database db = await CourseProvider._getInstanse();
    Map<String, dynamic> json = model.toJson(save: true);
    try {
      int id = await db.insert('saved_courses', {"json": json.toString(), "name": model.title});
      print("ADDED:::$id");
    } catch (e) {
      print(e);
    }
  }

  static void delCourse(CourseModel model) async {
    Database db = await CourseProvider._getInstanse();
    try {
      int rows = await db.delete("saved_courses", where: "name = ?", whereArgs: [model.title]);
      print("DELETED::$rows");
    } catch (e) {
      print(e);
    }
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
    List<CourseModel> list = (previous as List<CourseModel>) + (others as List<CourseModel>) + (mostPopular as List<CourseModel>);
    return list;
  }
}
