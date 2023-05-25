import 'package:tmsgraduatework/models/teacher_model.dart';
import 'package:tmsgraduatework/src/api.dart';

class TeacherProvider {
  Future<List<TeacherModel>> getTeachers() async {
    final json = await Api.get('teachers');
    return (json['teachers'] as List)
        .map((e) => TeacherModel.fromJson(e))
        .toList();
  }
}
