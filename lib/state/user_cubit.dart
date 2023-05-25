import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/user_model.dart';
import 'package:tmsgraduatework/providers/user_provider.dart';

class UserCubit extends Cubit<UserModel?> {
  final UserProvider _provider = UserProvider();
  UserCubit() : super(null) {
    load();
  }

  void load() async {
    emit(await _provider.getUser());
  }
}
