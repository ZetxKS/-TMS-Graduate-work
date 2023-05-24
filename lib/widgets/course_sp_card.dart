import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';

class CourseSPCard extends StatelessWidget {
  final CourseModel model;
  const CourseSPCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 89,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onDoubleTap: () {
          BlocProvider.of<CourseCubit>(context, listen: false).delete(model);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 89,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: Image.network(model.image).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: LightThemeFonts.h3,
                    ),
                    Text(
                      model.teacher,
                      style: LightThemeFonts.second14,
                    ),
                    Row(
                      children: [
                        Icon(Icons.person_outline),
                        Text(
                          "${model.voters.toString()} studends",
                          style: LightThemeFonts.second14,
                        ),
                        Icon(
                          Icons.star,
                          color: LightThemeColors.starColor,
                        ),
                        Text(
                          "(${model.rating.toString()})",
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
      ),
    );
  }
}
