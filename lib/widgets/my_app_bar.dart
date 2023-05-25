import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tmsgraduatework/models/user_model.dart';
import 'package:tmsgraduatework/state/app_bar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/bottom_nav_cubit.dart';
import 'package:tmsgraduatework/state/user_cubit.dart';

import '../themes/light.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isIndex;
  final bool isProfile;
  final String? title;
  Size? size;
  @override
  Size preferredSize;

  MyAppBar({
    Key? key,
    required this.isIndex,
    required this.isProfile,
    this.title,
    this.size,
  })  : preferredSize = size ?? const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.isProfile
          ? LightThemeColors.profileAppBarBackground
          : LightThemeColors.appBarBackground,
      title: widget.isIndex
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
              widget.title ?? '',
              style: LightThemeFonts.h1.copyWith(
                  color: widget.isProfile ? Colors.white : Colors.black),
            ),
      centerTitle: !widget.isIndex,
      leading: !widget.isIndex
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: widget.isProfile ? Colors.white : Colors.black,
              ),
              onPressed: () {
                BlocProvider.of<BottomNavCubit>(context).navigate(context, 0);
              },
            )
          : null,
      actions: [
        if (widget.isIndex)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BlocBuilder<UserCubit, UserModel?>(
              builder: (context, state) {
                Image? image = null;
                if (state == null) {
                  image = Image.asset('assets/images/avatar.jpg');
                } else {
                  image = Image.network(state.avatar);
                }
                return Container(
                  child: CircleAvatar(backgroundImage: image.image),
                );
              },
            ),
          ),
        if (widget.isProfile)
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      ],
      elevation: 0,
    );
  }
}
