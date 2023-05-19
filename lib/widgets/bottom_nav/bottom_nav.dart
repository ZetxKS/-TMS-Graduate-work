import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmsgraduatework/widgets/bottom_nav/bottom_nav_button.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BottomNavButton(
            svg: 'home',
            name: 'Home',
            navigateTo: '/',
          ),
          BottomNavButton(
            svg: 'search',
            name: 'Search',
            navigateTo: '/search',
          ),
          BottomNavButton(
            svg: 'Bookmarl',
            name: 'Saved',
            navigateTo: '/bookmark',
          ),
          BottomNavButton(
            svg: 'User',
            name: 'Profile',
            navigateTo: '/profile',
          ),
        ],
      ),
    );
  }
}
