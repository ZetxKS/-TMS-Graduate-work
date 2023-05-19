import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmsgraduatework/app_router.dart';
import 'package:tmsgraduatework/themes/light.dart';

class BottomNavButton extends StatelessWidget {
  final String svg;
  final String name;
  final String navigateTo;
  const BottomNavButton(
      {Key? key,
      required this.svg,
      required this.name,
      required this.navigateTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final active = (AutoRouter.of(context).currentPath == navigateTo);
    return InkWell(
      onTap: () {
        final _router = AutoRouter.of(context);
        if (active && navigateTo != '/') {
          return;
        } else if (navigateTo == '/') {
          _router.pushAndPopUntil(IndexRoute(), predicate: (_) => false);
          return;
        }
        _router.pushNamed(navigateTo);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            if (active)
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
            if (active)
              const SizedBox(
                width: 15,
              ),
            if (active)
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
