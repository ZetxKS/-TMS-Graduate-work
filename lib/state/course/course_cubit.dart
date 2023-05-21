import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/providers/course_provider.dart';
import 'package:tmsgraduatework/state/api_state.dart';

class CourseCubit extends Cubit<ApiState> {
  final _courseProvider = CourseProvider();

  CourseCubit() : super(ApiEmptySate());

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
