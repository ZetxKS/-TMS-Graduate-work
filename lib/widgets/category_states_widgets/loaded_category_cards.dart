import 'package:flutter/material.dart';
import 'package:tmsgraduatework/models/category_model.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:tmsgraduatework/widgets/category_card.dart';

class LoadedCategoryCards extends StatelessWidget {
  final List<CategoryModel> categories;
  final int type;
  const LoadedCategoryCards(
      {super.key, required this.categories, this.type = 1});

  @override
  Widget build(BuildContext context) {
    if (type == 1) {
      return Row(
        children: [
          CategoryCard(model: categories[0]),
          SizedBoxes.w10,
          CategoryCard(model: categories[1])
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories", style: LightThemeFonts.second14,),
          SizedBoxes.h30,
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: categories.map((e) => CategoryCard(model: e)).toList(),
            ),
          ),
        ],
      );
    }
  }
}
