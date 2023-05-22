import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/category/category_cubit.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/widgets/index_screen/popular_category.dart';
import 'package:tmsgraduatework/widgets/index_screen/popular_courses.dart';
import 'package:tmsgraduatework/widgets/index_screen/popular_teachers.dart';
import 'package:tmsgraduatework/widgets/index_screen/search_text_field.dart';

@RoutePage()
class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<CourseCubit>().load();
    context.watch<CategoryCubit>().load();
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        SearchTextField(),
        const SizedBox(
          height: 40,
        ),
        PopularCategory(),
        const SizedBox(
          height: 40,
        ),
        PopularCourses(),
        const SizedBox(
          height: 40,
        ),
        PopularTeachers(),
      ],
    );
  }
}
