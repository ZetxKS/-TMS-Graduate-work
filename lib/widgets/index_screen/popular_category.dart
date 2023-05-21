import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/category/category_cubit.dart';
import 'package:tmsgraduatework/widgets/category_card.dart';
import 'package:tmsgraduatework/models/category_model.dart';
import 'package:tmsgraduatework/widgets/index_screen/block_header.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlockHeader(title: "Popular category our in platform", navTo: 1,),
        SizedBox(height: 30,),
        BlocBuilder<CategoryCubit, ApiState>(
            builder: (BuildContext context, ApiState state) {
          switch (state.runtimeType) {
            case ApiEmptySate:
              return const _empty();
            case ApiLoadingState:
              return const _loading();
            case ApiLoadedState:
              return _loaded(categories: (state as ApiLoadedState).list as List<CategoryModel>);
            case ApiErrorState:
              return const _error();
            default:
              return const SizedBox();
          }
        }),
      ],
    );
  }
}

class _loading extends StatelessWidget {
  const _loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
            child: CircularProgressIndicator(),
          );
  }
}
class _loaded extends StatelessWidget {
  final List<CategoryModel> categories;
  const _loaded({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              CategoryCard(
                  model: categories[0]),
              const SizedBox(
                width: 14,
              ),
              CategoryCard(
                  model: categories[1])
            ],
          );
  }
}
class _empty extends StatelessWidget {
  const _empty({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
class _error extends StatelessWidget {
  const _error({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}