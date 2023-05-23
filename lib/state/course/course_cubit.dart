import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/providers/course_provider.dart';
import 'package:tmsgraduatework/state/api_state.dart';

class CourseCubit extends Cubit<ApiState> {
  final _courseProvider = CourseProvider();

  CourseCubit() : super(ApiEmptySate());

  void loadLocal() async {
    emit(ApiLoadingState());
    List<CourseModel> list = await _courseProvider.getLocalCourses();
    if(list.isNotEmpty) {
      emit(ApiLoadedState(list: list));
    } else {
      emit(ApiEmptySate());
    }
  }

  Future<void> save(CourseModel model) async {
    await _courseProvider.saveCourse(model);
    loadLocal();
  }

  Future<void> delete(CourseModel model) async {
    await _courseProvider.delCourse(model);
    loadLocal();
  }

  void load() async {
    try {
      final List<CourseModel> courses =
          await _courseProvider.getCourses();
      if (courses.isNotEmpty) {
        emit(ApiLoadedState(list: courses));
      } else {
        emit(ApiEmptySate());
      }
    } catch (e) {
      emit(ApiErrorState(e.toString()));
    }
  }
}
