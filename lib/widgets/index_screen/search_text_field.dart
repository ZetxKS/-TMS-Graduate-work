import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmsgraduatework/themes/light.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFFFFF1F3),
        style: BorderStyle.none,
        width: 0,
      ),
    );
    return TextField(
      decoration: InputDecoration(
        hintText: "Graphic illustration",
        hintStyle: LightThemeFonts.second16,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
          ),
        ),
        border: border,
        enabledBorder: border,
        errorBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        filled: true,
        fillColor: Color(0xFFFFF1F3),
      ),
    );
  }
}
