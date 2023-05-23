import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';

class CourseSPCard extends StatelessWidget {
  //final CourseModel model;
  const CourseSPCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<CourseCubit>().loadLocal();
    //final CourseModel course = CourseModel(image: "image", title: "title", rating: 5.1, voters: 55, teacher: "teacher", label: "label");
    //context.watch<CourseCubit>().save(course);
    //context.watch<CourseCubit>().delete(course);
    return SizedBox(
      height: 89,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 89,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: Image.asset('assets/images/poptback.jpg').image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: LightThemeFonts.h3,
                  ),
                  Text(
                    "Author",
                    style: LightThemeFonts.second14,
                  ),
                  Row(
                    children: [
                      Icon(Icons.person_outline),
                      Text(
                        "4k studends",
                        style: LightThemeFonts.second14,
                      ),
                      Icon(
                        Icons.star,
                        color: LightThemeColors.starColor,
                      ),
                      Text(
                        "(4.1)",
                        style: LightThemeFonts.second14,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
