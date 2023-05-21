import 'package:flutter/material.dart';
import 'package:tmsgraduatework/models/course_model.dart';

class CourseCardIndex extends StatelessWidget {
  final CourseModel model;
  const CourseCardIndex({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.network(model.image),
      Flexible(child: Text(model.title)),
      Flexible(child: Text(model.teacher)),
      
    ],);
  }
}