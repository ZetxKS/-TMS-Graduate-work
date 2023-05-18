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
    return AppBar(
      backgroundColor: LightThemeColors.appBarBackground,
      title: RichText(
        text: TextSpan(
          text: "Hola, sayef!",
          style: LightThemeFonts.h1,
          children: <TextSpan>[
            TextSpan(
              text: '\nWhat do you wanna learn today?',
              style: LightThemeFonts.second11l.copyWith(
                fontWeight: FontWeight.normal,
                height: 2
              )
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ),
      ],
      elevation: 0,
    );
  }
}