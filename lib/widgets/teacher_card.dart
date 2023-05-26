import 'package:flutter/material.dart';
import 'package:tmsgraduatework/models/teacher_model.dart';
import 'package:tmsgraduatework/themes/light.dart';

class TeacherCard extends StatelessWidget {
  final TeacherModel model;
  const TeacherCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.avatar).image,
        ),
        SizedBoxes.w10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: LightThemeFonts.normal,
              ),
              Text(
                model.nickname,
                style: LightThemeFonts.second14.copyWith(height: 1.5),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(model.followed ? 'Follow' : 'View',
              style: TextStyle(
                color: model.followed ? Colors.black : Colors.white,
              )),
          style: ElevatedButton.styleFrom(
            backgroundColor: model.followed
                ? LightThemeColors.teacherCardButtonColorActive
                : LightThemeColors.teacherCardButtonColorUnactive,
          ),
        ),
      ],
    );
  }
}
