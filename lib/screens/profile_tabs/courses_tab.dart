import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';

@RoutePage()
class CourseTabScreen extends StatelessWidget {
  const CourseTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*BlocBuilder<CourseCubit, List<List<CourseModel>>(
      builder: (context, state) {
        ret
      },
    );*/
    return const Placeholder();
  }
}
