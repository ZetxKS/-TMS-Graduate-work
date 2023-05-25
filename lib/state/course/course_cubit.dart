import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/providers/course_provider.dart';
import 'package:tmsgraduatework/state/api_state.dart';

class CourseCubit extends Cubit<ApiState> {
  final _courseProvider = CourseProvider();

  CourseCubit() : super(ApiEmptySate()) {
    load();
  }

  Future<void> save(CourseModel model) async {
    await _courseProvider.saveCourse(model);
    load();
  }

  Future<void> delete(CourseModel model) async {
    await _courseProvider.delCourse(model);
    load();
  }

  void load() async {
    try {
      final List<dynamic> result = [];
      result.add(await _courseProvider.getCourses());
      result.add(await _courseProvider.getLocalCourses() ?? []);
      if (result[0].isNotEmpty) {
        emit(ApiLoadedState(list: result));
      } else {
        emit(ApiEmptySate());
      }
    } catch (e) {
      emit(ApiErrorState(e.toString()));
    }
  }
}
