import 'package:flutter/material.dart';

class PopularTeacherCard extends StatelessWidget {
  const PopularTeacherCard({super.key});

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
                alignment: Alignment.bottomCenter
              )
            ),
            child: Image.asset('assets/images/teacher1.png',),
          )
        ],
      ),
    );
  }
}
