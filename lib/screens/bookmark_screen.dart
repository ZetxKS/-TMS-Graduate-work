import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/app_bar_cubit.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tmsgraduatework/widgets/course_sp_card.dart';
import 'package:tmsgraduatework/widgets/index_screen/courses_states_widgets/empty_courses_cards.dart';

@RoutePage()
class BookmakrScreen extends StatelessWidget {
  const BookmakrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CourseCubit _courseCubit = context.watch<CourseCubit>();
    if (_courseCubit.runtimeType is! ApiLoadedState) {
      _courseCubit.load();
    }
    return BlocBuilder<CourseCubit, ApiState>(
      builder: (BuildContext context, ApiState state) {
        switch (state.runtimeType) {
          case ApiEmptySate:
            return SizedBox();
          case ApiLoadingState:
            return const SizedBox();
          case ApiLoadedState:
            List<CourseModel> list =
                ((state as ApiLoadedState).list[1] as List<CourseModel>);
            if (list.isEmpty) {
              return _emptyList();
            }
            /*return ListView(
                children: ((state as ApiLoadedState).list[1] as List<CourseModel>).map((e) => CourseSPCard(model: e)).toList(),
              );*/
            return ListView.builder(
              itemBuilder: (context, id) => Column(
                children: [SizedBoxes.h10, CourseSPCard(model: list[id])],
              ),
              itemCount: list.length,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            );
          case ApiErrorState:
            return SizedBox();
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class _emptyList extends StatelessWidget {
  const _emptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/empty_saved.jpg'),
          SizedBoxes.h50,
          Text(
            "We found nothing in your save list! Want to have some? Try something best",
            style: LightThemeFonts.second16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
