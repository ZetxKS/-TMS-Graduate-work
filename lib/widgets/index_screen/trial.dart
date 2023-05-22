import 'package:flutter/material.dart';
import 'package:tmsgraduatework/themes/light.dart';

class TrialWidget extends StatelessWidget {
  const TrialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: LightThemeColors.trialBackground,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Try free trial to enhance your creative journey!",
              style: LightThemeFonts.h2, textAlign: TextAlign.center),
          SizedBoxes.h30,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              "Get free trial",
              style: LightThemeFonts.normal.copyWith(
                color: LightThemeColors.menuActive,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
