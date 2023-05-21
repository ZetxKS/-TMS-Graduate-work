import 'package:flutter/material.dart';

class utils {
  static List<Row> make_grid<T>(List list, StatelessWidget widget) {
    List<Row> result = [];
    /*for(var i = 0; i < list.length-1; i+=2) {
      result.add(Row(children: [
        widget(model: (list[i] as <T>)),
        SizedBox(width: 10,),
        widget(model: (list[(i+1)] as <T>))
      ],),);
    }*/
    return result;
  }
}