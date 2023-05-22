import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/category/category_cubit.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/widgets/index_screen/other_watching_courses.dart';
import 'package:tmsgraduatework/widgets/index_screen/popular_category.dart';
import 'package:tmsgraduatework/widgets/index_screen/popular_courses.dart';
import 'package:tmsgraduatework/widgets/index_screen/popular_teachers.dart';
import 'package:tmsgraduatework/widgets/index_screen/previous_class_courses.dart';
import 'package:tmsgraduatework/widgets/index_screen/search_text_field.dart';
import 'package:tmsgraduatework/widgets/index_screen/trial.dart';

@RoutePage()
class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.watch<CourseCubit>().state is! ApiLoadedState) {
      context.watch<CourseCubit>().load();
    }
    if(context.watch<CategoryCubit>().state is! ApiLoadedState) {
      context.watch<CategoryCubit>().load();
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: const [
        SearchTextField(),
        SizedBoxes.h40,
        PopularCategory(),
        SizedBoxes.h40,
        PopularCourses(),
        SizedBoxes.h40,
        PopularTeachers(),
        SizedBoxes.h40,
        TrialWidget(),
        SizedBoxes.h40,
        PreviousClassCourses(),
        SizedBoxes.h40,
        OtherWatchingCourses()
      ],
    );
  }
}
