import 'package:flutter/material.dart';
import 'package:tmsgraduatework/widgets/index_screen/see_more.dart';

import '../../themes/light.dart';

class BlockHeader extends StatelessWidget {
  final String title;
  final int? navTo;

  const BlockHeader({super.key, required this.title, this.navTo});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: Text(
          title,
          style: LightThemeFonts.h1,
        )),
        SizedBoxes.w30,
        SeeMore(
          navTo: navTo,
        )
      ],
    );
  }
}
