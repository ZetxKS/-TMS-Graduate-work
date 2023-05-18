import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmsgraduatework/widgets/bottom_nav/bottom_nav.dart';
import 'package:tmsgraduatework/widgets/my_app_bar.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: AutoRouter(),
      bottomNavigationBar: BottomNav(),
    );
  }
}
