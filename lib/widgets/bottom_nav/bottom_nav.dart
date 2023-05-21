import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/state/bottom_nav_cubit.dart';
import 'package:tmsgraduatework/widgets/bottom_nav/bottom_nav_button.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, int index) {
        return Container(
          height: 58,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BottomNavButton(
                svg: 'home',
                name: 'Home',
                toIndex: 0,
              ),
              BottomNavButton(
                svg: 'search',
                name: 'Search',
                toIndex: 1,
              ),
              BottomNavButton(
                svg: 'Bookmarl',
                name: 'Saved',
                toIndex: 2,
              ),
              BottomNavButton(
                svg: 'User',
                name: 'Profile',
                toIndex: 3,
              ),
            ],
          ),
        );
      },
    );
  }
}
