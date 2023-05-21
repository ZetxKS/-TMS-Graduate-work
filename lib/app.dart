import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmsgraduatework/app_router.dart';
import 'package:tmsgraduatework/providers/category_provider.dart';
import 'package:tmsgraduatework/state/bottom_nav_cubit.dart';
import 'package:tmsgraduatework/state/category/category_cubit.dart';
import 'package:tmsgraduatework/state/app_bar_cubit.dart';
import 'package:tmsgraduatework/state/course/course_cubit.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryProvider().getCategoryes();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppBarCubit()),
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => CategoryCubit()),
        BlocProvider(create: (_) => CourseCubit(),),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: ThemeData(fontFamily: 'Roboto'),
      ),
    );
  }
}
