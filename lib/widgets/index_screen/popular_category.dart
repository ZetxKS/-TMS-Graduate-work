import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/category/category_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/models/category_model.dart';
import 'package:tmsgraduatework/widgets/category_states_widgets/empty_category_cards.dart';
import 'package:tmsgraduatework/widgets/category_states_widgets/error_category_cards.dart';
import 'package:tmsgraduatework/widgets/category_states_widgets/loaded_category_cards.dart';
import 'package:tmsgraduatework/widgets/category_states_widgets/loading_category_cards.dart';
import 'package:tmsgraduatework/widgets/index_screen/block_header.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlockHeader(
          title: "Popular category our in platform",
          navTo: 1,
        ),
        SizedBoxes.h30,
        BlocBuilder<CategoryCubit, ApiState>(
          builder: (BuildContext context, ApiState state) {
            switch (state.runtimeType) {
              case ApiEmptySate:
                return const EmptyCategoryCards();
              case ApiLoadingState:
                return const LoadingCategoryCards();
              case ApiLoadedState:
                return LoadedCategoryCards(
                    categories:
                        (state as ApiLoadedState).list as List<CategoryModel>);
              case ApiErrorState:
                return const ErrorCategoryCards();
              default:
                return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}