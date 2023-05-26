import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/teacher_model.dart';
import 'package:tmsgraduatework/state/teachers_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/widgets/teacher_card.dart';

@RoutePage()
class TeachersScreen extends StatelessWidget {
  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersCubit, List<TeacherModel>>(
      builder: (context, state) {
        if (state.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top teacher this month",
                  style: LightThemeFonts.h3.copyWith(fontSize: 18),
                ),
                SizedBoxes.h20,
                Expanded(
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          TeacherCard(model: state[index]),
                          SizedBoxes.h20
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
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
