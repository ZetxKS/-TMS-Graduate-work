import 'package:flutter/material.dart';
import 'package:tmsgraduatework/widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Placeholder(),
    );
  }
}
