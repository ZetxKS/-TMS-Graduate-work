import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tmsgraduatework/themes/light.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: LightThemeColors.profileAppBarBackground,
            padding: EdgeInsets.all(10),
            child: PreferredSize(
              preferredSize: Size.fromWidth(120),
              child: Image.asset('assets/images/avatar.jpg'),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('asd'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('asd1'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('asd2'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
