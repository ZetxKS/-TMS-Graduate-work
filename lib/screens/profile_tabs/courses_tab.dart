import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/widgets/course_sp_card.dart';

@RoutePage()
class CourseTabScreen extends StatelessWidget {
  const CourseTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, ApiState>(
      builder: (context, state) {
        if (state is ApiLoadedState) {
          List<CourseModel> list =
              ((state as ApiLoadedState).list[1] as List<CourseModel>);
          return ListView.builder(
            itemBuilder: (context, id) => Column(
              children: [SizedBoxes.h10, CourseSPCard(model: list[id])],
            ),
            itemCount: list.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
