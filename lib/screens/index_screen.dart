import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmsgraduatework/providers/category_provider.dart';
import 'package:tmsgraduatework/widgets/category_card.dart';
import 'package:tmsgraduatework/widgets/index_screen/search_text_field.dart';
import 'package:tmsgraduatework/widgets/my_app_bar.dart';
import 'package:tmsgraduatework/widgets/bottom_nav/bottom_nav.dart';

@RoutePage()
class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryProvider cp = CategoryProvider();
    cp.getCategoryes();
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SearchTextField(),
          Row(
            children: [
              CategoryCard(),
              SizedBox(
                width: 14,
              ),
              CategoryCard()
            ],
          )
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
