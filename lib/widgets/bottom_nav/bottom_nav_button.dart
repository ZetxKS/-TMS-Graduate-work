import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmsgraduatework/state/app_bar_cubit.dart';
import 'package:tmsgraduatework/state/bottom_nav_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';

class BottomNavButton extends StatelessWidget {
  final String svg;
  final String name;
  final int toIndex;
  const BottomNavButton({
    Key? key,
    required this.svg,
    required this.name,
    required this.toIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavCubit bottomNavCubit = context.watch<BottomNavCubit>();
    return InkWell(
      onTap: () {
        final List<String> appbartitles = [
          "",
          "",
          "My saved List",
          "Profile",
        ];

        BlocProvider.of<AppBarCubit>(context, listen: false)
            .setTitle(appbartitles[toIndex]);
        BlocProvider.of<AppBarCubit>(context, listen: false).setPage(toIndex);
        bottomNavCubit.navigate(context, toIndex);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            if (bottomNavCubit.state == toIndex)
              Container(
                padding: const EdgeInsets.all(10),
                //HELP: Пытался расскрасить с помощью кода, просто подставляется другая картинка((( SvgPicture.asset('assets/icons/$svg.svg', colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),),
                decoration: const BoxDecoration(
                  color: LightThemeColors.menuActive,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset('assets/icons/${svg}_active.svg'),
              )
            else
              SvgPicture.asset('assets/icons/$svg.svg'),
            if (bottomNavCubit.state == toIndex)
              const SizedBox(
                width: 15,
              ),
            if (bottomNavCubit.state == toIndex)
              Text(
                name,
                style: LightThemeFonts.bottomNav,
              ),
          ],
        ),
      ),
    );
  }
}
