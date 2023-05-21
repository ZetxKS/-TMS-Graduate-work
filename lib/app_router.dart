import 'package:flutter/material.dart';
import 'package:tmsgraduatework/screens/app_screen.dart';
import 'package:tmsgraduatework/screens/index_screen.dart';
import 'package:tmsgraduatework/screens/search_screen.dart';
import 'package:tmsgraduatework/screens/bookmark_screen.dart';
import 'package:tmsgraduatework/screens/profile_screen.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppRoute.page, path: '/', children: [
          AutoRoute(page: IndexRoute.page, path: 'index', initial: true),
          AutoRoute(page: SearchRoute.page, path: 'search'),
          AutoRoute(page: BookmakrRoute.page, path: 'bookmark'),
          AutoRoute(page: ProfileRoute.page, path: 'profile')
        ])
      ];
}
