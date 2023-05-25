import 'package:tmsgraduatework/models/user_model.dart';
import 'package:tmsgraduatework/src/api.dart';

class UserProvider {
  Future<UserModel> getUser() async {
    final Map<String, dynamic> json = await Api.get('user');
    return UserModel.fromJson(json);
  }
}
