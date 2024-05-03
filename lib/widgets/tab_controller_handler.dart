import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabControllerHandler extends InheritedWidget {
  final TabController tabController;
  final Widget child;

  TabControllerHandler({
    Key? key,
    required this.tabController,
    required this.child,
  }) : super(key: key, child: child);

  static TabControllerHandler? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TabControllerHandler>();
  }

  @override
  bool updateShouldNotify(TabControllerHandler oldWidget) {
    return oldWidget.tabController != tabController;
  }
}