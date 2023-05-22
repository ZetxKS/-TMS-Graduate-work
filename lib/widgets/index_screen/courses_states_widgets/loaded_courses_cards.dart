import 'package:flutter/cupertino.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/widgets/index_screen/course_card.dart';

class LoadedCoursesCards extends StatelessWidget {
  final int type;
  final List<CourseModel> courses;

  LoadedCoursesCards({super.key, required this.courses, required this.type});

  @override
  Widget build(BuildContext context) {
    List<CourseModel> courses = [];
    for (CourseModel course in this.courses) {
      if (course.type == type) {
        courses.add(course);
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CourseCardIndex(model: courses[0]),
        SizedBoxes.w10,
        CourseCardIndex(model: courses[1])
      ],
    );
  }
}