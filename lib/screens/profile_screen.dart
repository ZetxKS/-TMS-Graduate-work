import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/app_router.dart';
import 'package:tmsgraduatework/models/teacher_model.dart';
import 'package:tmsgraduatework/models/user_model.dart';
import 'package:tmsgraduatework/state/api_state.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';
import 'package:tmsgraduatework/state/teachers_cubit.dart';
import 'package:tmsgraduatework/state/user_cubit.dart';
import 'package:tmsgraduatework/themes/light.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserModel?>(builder: (context, state) {
      if (state == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Padding(
        padding: EdgeInsets.only(top: 70, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.nickname,
                      style: LightThemeFonts.h1,
                    ),
                    SizedBoxes.h20,
                    Text(
                      "Just a simple guy who loves do something new and fun! 😜",
                      style: LightThemeFonts.second14,
                      textAlign: TextAlign.center,
                    ),
                    SizedBoxes.h20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/icons/05.instagram.png'),
                        Image.asset('assets/icons/01.facebook.png'),
                        Image.asset('assets/icons/02.twitter.png'),
                      ],
                    ),
                  ]),
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
                return Expanded(
                  child: Column(
                    // fit: StackFit.passthrough,
                    children: [
                      Stack(
                        fit: StackFit.passthrough,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: LightThemeColors.profileTabsBorderSide,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          TabBar(
                            tabs: [
                              Tab(
                                child: TabButton(
                                  count: state.projects.length,
                                  name: "Projects",
                                ),
                              ),
                              Tab(
                                child: TabButton(
                                  count: ((BlocProvider.of<CourseCubit>(context)
                                              .state as ApiLoadedState)
                                          .list[1] as List)
                                      .length,
                                  name: "Courses",
                                ),
                              ),
                              Tab(
                                child: TabButton(
                                  count: BlocProvider.of<TeachersCubit>(context)
                                      .getFollowed()
                                      .length,
                                  name: "Followers",
                                ),
                              ),
                            ],
                            controller: controller,
                          ),
                        ],
                      ),
                      SizedBoxes.h20,
                      Expanded(
                        child: SizedBox(
                          child: child,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
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
