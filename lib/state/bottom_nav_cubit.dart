import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void navigate(BuildContext context, int index) {
    final active = (AutoTabsRouter.of(context).activeIndex == index);
    final _tabsRouter = AutoTabsRouter.of(context);
    if (active && index != 0) {
      return;
    }
    _tabsRouter.popTop();
    emit(index);
    _tabsRouter.setActiveIndex(index);
  }
}
