import 'package:flutter/material.dart';
import 'package:tmsgraduatework/themes/light.dart';

class PopularTeacherCard extends StatelessWidget {
  final int id;
  final String name;
  final String profession;
  const PopularTeacherCard(
      {super.key,
      required this.id,
      required this.name,
      required this.profession});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset('assets/images/poptback.jpg').image,
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/teacher$id.png',
                height: 180,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: LightThemeFonts.h3,
                ),
                SizedBoxes.h10,
                Text(
                  profession,
                  style: LightThemeFonts.second14,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
