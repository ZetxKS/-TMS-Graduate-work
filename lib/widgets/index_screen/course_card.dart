import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';

class CourseCardIndex extends StatelessWidget {
  final CourseModel model;
  const CourseCardIndex({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onDoubleTap: () {
          BlocProvider.of<CourseCubit>(context, listen: false).save(model);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 146,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: Image.network(model.image).image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                    decoration: BoxDecoration(
                        color: LightThemeColors.badgeBackground,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      model.label.toUpperCase(),
                      style:
                          LightThemeFonts.second14.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBoxes.h10,
            Text(
              model.title,
              style: LightThemeFonts.h3,
            ),
            SizedBoxes.h10,
            Text(
              model.teacher,
              style: LightThemeFonts.second12d,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.rating.toString(),
                  style: LightThemeFonts.second11l,
                ),
                SizedBoxes.w10,
                _rating(rating: model.rating),
                Expanded(
                  child: Text(
                    "(${model.voters})",
                    style: LightThemeFonts.second12d,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _rating extends StatelessWidget {
  final double rating;
  const _rating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    for (var i = 0; i < rating.floor(); i++) {
      stars.add(const Icon(
        Icons.star,
        color: LightThemeColors.starColor,
        size: 20,
      ));
    }
    if ((rating - rating.floor()) != 0) {
      stars.add(
        GradientIcon(
          Icons.star,
          20,
          LinearGradient(
              colors: [
                LightThemeColors.starColor,
                LightThemeColors.starColor,
                LightThemeColors.starColor.withOpacity(0)
              ],
              begin: const FractionalOffset(0, 1),
              stops: [(rating - rating.floor()), 1, 1],
              end: FractionalOffset((rating - rating.floor()), 1)),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: stars,
    );
  }
}

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon,
    this.size,
    this.gradient,
  );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
