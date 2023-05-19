import 'package:flutter/material.dart';

class LightThemeColors {
  static const firstText = Color(0xFF0B121F);
  static const secondText = Color(0xFF70747E);
  static const secondDarkText = Color(0xFF585D69);
  static const inputTextPlaceholder = Color(0xFF888C94);
  static const badgeBackground = Color(0xFF282F3E);
  static const badgeText = Color(0xFFFFFFFF);
  static const menuActive = Color(0xFF265AE8);
  static const menuText = Color(0xFF404653);
  static const appBarBackground = Color(0xFFFFFFFF);
}

class LightThemeFonts {
  static const h1 = TextStyle(
      fontSize: 25,
      color: LightThemeColors.firstText,
      fontWeight: FontWeight.w700);
  static const h2 = TextStyle(
      fontSize: 22,
      color: LightThemeColors.firstText,
      fontWeight: FontWeight.w500);
  static const h3 = TextStyle(
      fontSize: 15,
      color: LightThemeColors.firstText,
      fontWeight: FontWeight.w500);
  static const normal = TextStyle(
    fontSize: 18,
    color: LightThemeColors.firstText,
  );
  static const second11l = TextStyle(
    fontSize: 11,
    color: LightThemeColors.secondText,
  );
  static const second12l = TextStyle(
    fontSize: 12,
    color: LightThemeColors.secondText,
  );
  static const second12d = TextStyle(
    fontSize: 12,
    color: LightThemeColors.secondDarkText,
  );
  static const second14 = TextStyle(
    fontSize: 14,
    color: LightThemeColors.secondText,
  );
  static const second16 = TextStyle(
    fontSize: 16,
    color: LightThemeColors.secondText,
  );
  static const bottomNav = TextStyle(
    fontSize: 15,
    color: LightThemeColors.menuText,
  );
}
