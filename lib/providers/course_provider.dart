import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/src/api.dart';

class CourseProvider {
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
