import 'package:bloc/bloc.dart';

class AppBarCubit extends Cubit<Map<String, dynamic>> {
  AppBarCubit() : super({'title': '', 'page': 0});

  void setTitle(text) {
    _addToState('title', text);
  }

  void setPage(pageId) {
    _addToState('page', pageId);
  }

  void _addToState(String key, dynamic value) {
    Map<String, dynamic> result = this.state;
    result[key] = value;
    emit(result);
  }
}
