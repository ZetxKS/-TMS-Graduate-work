import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/widgets/index_screen/block_header.dart';
import 'package:tmsgraduatework/widgets/index_screen/courses_states_widgets/empty_courses_cards.dart';
import 'package:tmsgraduatework/widgets/index_screen/courses_states_widgets/error_courses_cards.dart';
import 'package:tmsgraduatework/widgets/index_screen/courses_states_widgets/loaded_courses_cards.dart';
import 'package:tmsgraduatework/widgets/index_screen/courses_states_widgets/loading_courses_cards.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockHeader(title: "Most watching category in month"),
        SizedBoxes.h30,
        BlocBuilder<CourseCubit, ApiState>(
            builder: (BuildContext context, ApiState state) {
          switch (state.runtimeType) {
            case ApiEmptySate:
              return const EmptyCoursesCards();
            case ApiLoadingState:
              return const LoadingCoursesCards();
            case ApiLoadedState:
              return LoadedCoursesCards(
                courses: (state as ApiLoadedState).list[0] as List<CourseModel>,
                type: 3,
              );
            case ApiErrorState:
              return ErrorCoursesCards(
                error: (state as ApiErrorState).error,
              );
            default:

              return const SizedBox();
          }
        })
      ],
    );
  }
}