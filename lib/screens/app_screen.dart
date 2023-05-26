import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/app_router.dart';
import 'package:tmsgraduatework/models/user_model.dart';
import 'package:tmsgraduatework/state/app_bar_cubit.dart';
import 'package:tmsgraduatework/state/user_cubit.dart';
import 'package:tmsgraduatework/widgets/bottom_nav/bottom_nav.dart';
import 'package:tmsgraduatework/widgets/my_app_bar.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, Map<String, dynamic>?>(
      builder: (context, state) {
        return AutoTabsScaffold(
          routes: const [
            IndexRoute(),
            SearchRoute(),
            BookmakrRoute(),
            ProfileRoute(),
            TeachersRoute()
          ],
          transitionBuilder: (context, child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          homeIndex: 0,
          appBarBuilder: (context, tabsRouter) {
            final _autoTabsRouter = AutoTabsRouter.of(context);
            if (state?['page'] != _autoTabsRouter.activeIndex) {
              context.watch<AppBarCubit>().setPage(_autoTabsRouter.activeIndex);
            }
            return MyAppBar(
              isIndex: (state?['page'] == 0),
              isProfile: (state?['page'] == 3),
              title: state?['title'] ?? "",
              size: (state?['page'] == 3 ? const Size.fromHeight(120) : null),
            );
          },
          bottomNavigationBuilder: (context, tabsRouter) {
            if (state!['page'] != 4) {
              return const BottomNav();
            } else {
              return SizedBox();
            }
          },
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          floatingActionButtonBuilder: ((context, tabsRouter) {
            if (state!['page'] == 3) {
              Image? image = null;
              UserModel? userState = BlocProvider.of<UserCubit>(context).state;
              if (userState != null) {
                image = Image.network(
                  userState.avatar,
                  height: state?['page'] == 3 ? 120 : 0,
                  width: state?['page'] == 3 ? 120 : 0,
                  fit: BoxFit.cover,
                );
              } else {
                image = Image.asset(
                  'assets/images/avatar.jpg',
                  height: state?['page'] == 3 ? 120 : 0,
                  width: state?['page'] == 3 ? 120 : 0,
                  fit: BoxFit.cover,
                );
              }
              return ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: image,
              );
            } else {
              return SizedBox();
            }
          }),
        );
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
