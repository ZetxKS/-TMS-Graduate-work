import 'package:flutter/material.dart';
import 'package:tmsgraduatework/widgets/my_app_bar.dart';
import 'package:tmsgraduatework/widgets/bottom_nav/bottom_nav.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class BookmakrScreen extends StatelessWidget {
  const BookmakrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Placeholder(),
      bottomNavigationBar: BottomNav(),
    );
  }
}
