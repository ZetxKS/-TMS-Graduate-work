import 'package:tmsgraduatework/models/category_model.dart';
import 'package:tmsgraduatework/src/api.dart';

class CategoryProvider {
  Future<List<CategoryModel>> getCategoryes() async {
    final json = await Api.get('categories');
    List<dynamic> list = json['categories'];
    return list.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
