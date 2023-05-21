import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tmsgraduatework/state/app_bar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/app_bar_cubit.dart';

import '../themes/light.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({Key? key})
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
    final _tabRouter = AutoTabsRouter.of(context);
    final bool _isIndex = _tabRouter.activeIndex == 0;
    final String title = context.watch<AppBarCubit>().state ?? '';
    return BlocBuilder<AppBarCubit, String?>(
      builder: (BuildContext context, String? text) => AppBar(
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
                title,
                style: LightThemeFonts.h1,
              ),
        centerTitle: !_isIndex,
        leading: !_isIndex
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
                onPressed: () {
                  _tabRouter.setActiveIndex(0);
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
      ),
    );
  }
}
