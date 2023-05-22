import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/category_model.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/app_bar_cubit.dart';
import 'package:tmsgraduatework/state/category/category_cubit.dart';
import 'package:tmsgraduatework/widgets/category_states_widgets/empty_category_cards.dart';
import 'package:tmsgraduatework/widgets/category_states_widgets/error_category_cards.dart';
import 'package:tmsgraduatework/widgets/category_states_widgets/loaded_category_cards.dart';
import 'package:tmsgraduatework/widgets/category_states_widgets/loading_category_cards.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<AppBarCubit>().state != "Search") {
      context.watch<AppBarCubit>().setTitle('Search');
    }
    if (context.watch<CategoryCubit>().state is! ApiLoadedState) {
      context.watch<CategoryCubit>().load();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: BlocBuilder<CategoryCubit, ApiState>(
        builder: (BuildContext context, ApiState state) {
          switch (state.runtimeType) {
            case ApiEmptySate:
              return const EmptyCategoryCards();
            case ApiLoadingState:
              return const LoadingCategoryCards();
            case ApiLoadedState:
              return LoadedCategoryCards(
                categories: (state as ApiLoadedState).list as List<CategoryModel>,
                type: 2,
              );
            case ApiErrorState:
              return const ErrorCategoryCards();
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
