import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/app_bar_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tmsgraduatework/widgets/course_sp_card.dart';

@RoutePage()
class BookmakrScreen extends StatelessWidget {
  const BookmakrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<AppBarCubit>().setTitle('My saved list');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top teacher this mounth", style: LightThemeFonts.h3.copyWith(fontWeight: FontWeight.bold),),
          Expanded(
            child: ListView(
              children: [
                CourseSPCard()
              ],
            ),
          )
        ],
      ),
    );
  }
}
