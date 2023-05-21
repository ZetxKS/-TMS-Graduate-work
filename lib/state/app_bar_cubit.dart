import 'package:bloc/bloc.dart';

class AppBarCubit extends Cubit<String?> {
  AppBarCubit(): super(null);

  void setTitle(String? text) {
    emit(text);
  }
}