import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  String? previousRoute;

  @override
  void didPop(Route route, Route? previousRoute) {
    this.previousRoute = previousRoute?.settings.name;
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    this.previousRoute = previousRoute?.settings.name;
    super.didPush(route, previousRoute);
  }
}
