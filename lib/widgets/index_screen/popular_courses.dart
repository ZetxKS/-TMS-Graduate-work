import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
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
  int type;
  int limit;
  List<CourseModel> preparedCourses = [];

  _loaded({super.key, required this.courses, this.type = 0, this.limit = 2});

  void prepareCourses() {
    preparedCourses = [];
    if (type == 0) {
      preparedCourses = courses.take(limit == 0 ? courses.length : limit).toList();
    } else {
      for (CourseModel course in courses) {
        if (course.type == type && ((limit == 0 && preparedCourses.length <= limit) || limit == 0)) {
          preparedCourses.add(course);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      children: preparedCourses.map((e) => CourseCardIndex(model: e)).toList(),
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
