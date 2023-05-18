import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmsgraduatework/app_router.dart';
import 'package:tmsgraduatework/themes/light.dart';

class BottomNavButton extends StatefulWidget {
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
  State<BottomNavButton> createState() => _BottomNavButtonState();
}

class _BottomNavButtonState extends State<BottomNavButton> {
  void navigate() {
    if(AutoRouter.of(context).currentPath != widget.navigateTo) {
      AutoRouter.of(context).pushNamed(widget.navigateTo);
    }
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            if (AutoRouter.of(context).currentPath == widget.navigateTo)
              Container(
                padding: const EdgeInsets.all(10),
                //HELP: Пытался расскрасить с помощью кода, просто подставляется другая картинка((( SvgPicture.asset('assets/icons/$svg.svg', colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),),
                decoration: const BoxDecoration(
                  color: LightThemeColors.menuActive,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset('assets/icons/${widget.svg}_active.svg'),
              )
            else
              SvgPicture.asset('assets/icons/${widget.svg}.svg'),
            if (AutoRouter.of(context).currentPath == widget.navigateTo)
              const SizedBox(
                width: 15,
              ),
            if (AutoRouter.of(context).currentPath == widget.navigateTo)
              Text(
                widget.name,
                style: LightThemeFonts.bottomNav,
              ),
          ],
        ),
      ),
    );
  }
}
