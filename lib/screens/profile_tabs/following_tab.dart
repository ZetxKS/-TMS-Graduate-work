import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/teacher_model.dart';
import 'package:tmsgraduatework/state/teachers_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/widgets/Teacher_card.dart';

@RoutePage()
class FollowingTabScreen extends StatelessWidget {
  const FollowingTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersCubit, List<TeacherModel>>(
      builder: (context, state) {
        if (state.isNotEmpty) {
          List<TeacherModel> followed =
              BlocProvider.of<TeachersCubit>(context).getFollowed();
          return ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  TeacherCard(model: followed[index]),
                  SizedBoxes.h20,
                ],
              );
            },
            itemCount: followed.length,
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
