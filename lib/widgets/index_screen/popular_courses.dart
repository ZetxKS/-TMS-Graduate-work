import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/src/utils.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/widgets/index_screen/block_header.dart';
import 'package:tmsgraduatework/widgets/index_screen/course_card.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlockHeader(title: "Most watching category in month"),
        SizedBox(height: 30,),
        BlocBuilder<CourseCubit, ApiState>(
            builder: (BuildContext context, ApiState state) {
          switch (state.runtimeType) {
            case ApiEmptySate:
              return const _empty();
            case ApiLoadingState:
              return const _loading();
            case ApiLoadedState:
              return _loaded(
                  courses: (state as ApiLoadedState).list as List<CourseModel>);
            case ApiErrorState:
              return _error(
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

class _empty extends StatelessWidget {
  const _empty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _loading extends StatelessWidget {
  const _loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _loaded extends StatelessWidget {
  final List<CourseModel> courses;

  _loaded({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    List<CourseModel> courses = [];
    for (CourseModel course in this.courses) {
      if (course.type == 3) {
        courses.add(course);
      }
    }
    return Row(
      children: [
        CourseCardIndex(model: courses[0]),
        SizedBox(
          width: 10,
        ),
        CourseCardIndex(model: courses[1])
      ],
    );
  }
}

class _error extends StatelessWidget {
  final String error;
  const _error({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
