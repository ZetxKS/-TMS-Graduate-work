import 'package:flutter/material.dart';

import '../themes/light.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text('Hola, sayef!', style: LightThemeFonts.h1,),
              Text('What do you wanna learn today?', style: LightThemeFonts.second14,),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle
            ),
            child: Image.asset('assets/images/avatar.jpg'),
          )
        ],
      ),
    );
    /*AppBar(
      backgroundColor: LightThemeColors.appBarBackground,
      title: const Text("Hola, sayef!", style: LightThemeFonts.h1),

    );*/
  }
}