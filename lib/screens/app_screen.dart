import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tmsgraduatework/app_router.dart';
import 'package:tmsgraduatework/widgets/bottom_nav/bottom_nav.dart';
import 'package:tmsgraduatework/widgets/my_app_bar.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        IndexRoute(),
        SearchRoute(),
        BookmakrRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      homeIndex: 0,
      appBarBuilder: (context, tabsRouter) => MyAppBar(),
      bottomNavigationBuilder: (context, tabsRouter) => BottomNav(),
    );
  }
}
