import 'package:flutter/material.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/themes/light.dart';

class CourseCardIndex extends StatelessWidget {
  final CourseModel model;
  const CourseCardIndex({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(
              model.image,
              fit: BoxFit.cover,
            ).image,
          ),
        ),
        height: 146,
        child: Text(
          model.label.toUpperCase(),
          style: LightThemeFonts.normal.copyWith(
            color: Colors.white,
            backgroundColor: LightThemeColors.badgeBackground,
          ),
        ),
      ),
    );
  }
}
