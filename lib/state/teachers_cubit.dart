import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/teacher_model.dart';
import 'package:tmsgraduatework/providers/teacher_provider.dart';

class TeachersCubit extends Cubit<List<TeacherModel>> {
  final _provider = TeacherProvider();
  TeachersCubit() : super([]) {
    load();
  }

  void load() async {
    emit(await _provider.getTeachers());
  }

  List<TeacherModel> getFollowed() {
    List<TeacherModel> result = [];
    for (int i = 0; i < this.state.length; i++) {
      if (this.state[i].followed == true) {
        result.add(this.state[i]);
      }
    }
    return result;
  }
}
