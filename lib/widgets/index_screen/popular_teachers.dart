import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/src/utils.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/widgets/index_screen/block_header.dart';
import 'package:tmsgraduatework/widgets/index_screen/course_card.dart';
import 'package:tmsgraduatework/widgets/index_screen/popular_teacher_card.dart';

class PopularTeachers extends StatelessWidget {
  const PopularTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlockHeader(title: "Our top popular teacher this month"),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [PopularTeacherCard(), PopularTeacherCard()],
        )
      ],
    );
  }
}
