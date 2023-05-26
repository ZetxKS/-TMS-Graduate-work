import 'package:flutter/material.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/widgets/index_screen/block_header.dart';
import 'package:tmsgraduatework/widgets/index_screen/popular_teacher_card.dart';

class PopularTeachers extends StatelessWidget {
  const PopularTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BlockHeader(title: "Our top popular teacher this month", navTo: 4),
        SizedBoxes.h30,
        Row(
          children: [
            PopularTeacherCard(
              id: 1,
              name: "Sayef Mahmud",
              profession: "Programmer",
            ),
            SizedBox(
              width: 10,
            ),
            PopularTeacherCard(
              id: 2,
              name: "Sarrah Mory",
              profession: "Creative artist",
            )
          ],
        )
      ],
    );
  }
}
