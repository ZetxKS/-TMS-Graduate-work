import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tmsgraduatework/app_router.dart';
import 'package:tmsgraduatework/themes/light.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "@isayef",
            style: LightThemeFonts.h1,
          ),
          SizedBoxes.h20,
          Text(
            "Just a simple guy who loves do something new and fun! 😜",
            style: LightThemeFonts.second14,
          ),
          SizedBoxes.h20,
          AutoTabsRouter.tabBar(
            routes: [
              ProjectTabRoute(),
              CourseTabRoute(),
              FollowingTabRoute(),
            ],
            homeIndex: 0,
            builder: (context, child, controller) {
              return Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(
                        child: TabButton(
                          count: 11,
                          name: "Projects",
                        ),
                      ),
                      Tab(
                        child: TabButton(
                          count: 21,
                          name: "Courses",
                        ),
                      ),
                      Tab(
                        child: TabButton(
                          count: 33,
                          name: "Followers",
                        ),
                      ),
                    ],
                    controller: controller,
                  )
                ],
              );
            },
          ),
          SizedBoxes.h20,
          /* TabBar(
            controller: ,
            tabs: [
              
            ],
          ) */
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final int count;
  final String name;
  const TabButton({
    super.key,
    required this.count,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            count.toString(),
            style: LightThemeFonts.second16,
          ),
          Text(
            name,
            style: LightThemeFonts.normal.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
