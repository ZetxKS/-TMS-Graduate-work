import 'package:flutter/material.dart';
import 'package:tmsgraduatework/themes/light.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: Image.asset(
              'assets/images/avatar.jpg',
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.75),
                  ],
                  begin: const FractionalOffset(1, 0),
                  end: const FractionalOffset(1, 0.75)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 27),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "TEsts",
                  style: LightThemeFonts.h2.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
