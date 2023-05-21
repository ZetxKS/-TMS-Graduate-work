import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/bottom_nav_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';

class SeeMore extends StatelessWidget {
  final int? navTo;
  const SeeMore({super.key, this.navTo});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (navTo != null) {
            BlocProvider.of<BottomNavCubit>(context).navigate(context, navTo!);
          }
        },
        child: const Text(
          "see more",
          style: LightThemeFonts.second14,
        ));
  }
}
