import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class RoutesManager {
  const RoutesManager(this.context);

  final BuildContext context;

  void cleanSpecificRoutes(String routePath) {
    final filteredRoutes = context.router.stack
        .where(
          (route) => route.name != routePath,
        )
        .map(
          (route) => PageRouteInfo<dynamic>(
            route.routeData.name,
          ),
        )
        .toList();

    // final newA = filteredRoutes.removeAt(filteredRoutes.length);

    context.router.replaceAll(filteredRoutes);
  }
}
