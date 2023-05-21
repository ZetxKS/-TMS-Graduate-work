import 'package:flutter/material.dart';
import 'package:tmsgraduatework/models/category_model.dart';
import 'package:tmsgraduatework/models/course_model.dart';
import 'package:tmsgraduatework/widgets/category_card.dart';
import 'package:tmsgraduatework/widgets/index_screen/course_card.dart';

class utils {
  static List<Row> make_grid(List list) {
    
    List<Row> result = [];
    for(var i = 0; i < list.length-1; i+=2) {
      Widget? w1;
      Widget? w2;

      switch(list[0].runtimeType) {
        case CategoryModel:
          w1 = CategoryCard(model: (list[i] as CategoryModel));
          if(list[(i+1)] != null) {
            w2 = CategoryCard(model: (list[(i+1)] as CategoryModel));
          }
        break;
        case CourseModel:
          w1 = CourseCardIndex(model: (list[i] as CourseModel));
          if(list[(i+1)] != null) {
            w2 = CourseCardIndex(model: (list[(i+1)] as CourseModel));
          }
          
        break;
      }
      result.add(Row(children: [
        if(w1 != null) w1,
        const SizedBox(width: 10,),
        if(w2 != null) w2
      ],),);
    }
    return result;
  }
}