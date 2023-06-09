import 'package:flutter/material.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel model;
  int mode;
  CategoryCard({super.key, required this.model, this.mode = 1});

  @override
  Widget build(BuildContext context) {
    Widget ret = Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: Image.network(
            model.image,
          ).image,
          fit: BoxFit.cover,
        ),
      ),
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
              model.name,
              style: LightThemeFonts.h2.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
    if(mode == 1) {
      return Expanded(child: ret);
    } else {
      return ret;
    }
  }
}
