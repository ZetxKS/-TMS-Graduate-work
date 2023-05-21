import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/providers/category_provider.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/models/category_model.dart';

class CategoryCubit extends Cubit<ApiState> {
  final _categoryProvider = CategoryProvider();

  CategoryCubit() : super(ApiEmptySate());

  void load() async {
    try {
      final List<CategoryModel> categories =
          await _categoryProvider.getCategoryes();
      if (categories.isNotEmpty) {
        emit(ApiLoadedState(list: categories));
      } else {
        emit(ApiEmptySate());
      }
    } catch (e) {
      emit(ApiErrorState(e.toString()));
    }
  }
}
