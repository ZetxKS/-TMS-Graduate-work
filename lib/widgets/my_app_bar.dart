import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../themes/light.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  MyAppBar({Key? key, this.title = ''})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final _isIndex = AutoRouter.of(context).currentPath == '/';
    return AppBar(
      backgroundColor: LightThemeColors.appBarBackground,
      title: _isIndex
          ? RichText(
              text: TextSpan(
                text: "Hola, sayef!",
                style: LightThemeFonts.h1,
                children: <TextSpan>[
                  TextSpan(
                      text: '\nWhat do you wanna learn today?',
                      style: LightThemeFonts.second11l
                          .copyWith(fontWeight: FontWeight.normal, height: 2))
                ],
              ),
            )
          : Text(
              widget.title,
              style: LightThemeFonts.h1,
            ),
      centerTitle: !_isIndex,
      leading: AutoRouter.of(context).canPop()
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () {
                AutoRouter.of(context).pop();
              },
            )
          : null,
      actions: [
        if (_isIndex)
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
