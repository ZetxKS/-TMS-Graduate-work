import 'package:flutter/material.dart';
import 'package:tmsgraduatework/app_router.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: ThemeData(fontFamily: 'Roboto'),
    );
  }
}
