import 'package:auto_route/auto_route.dart';

extension NavigationExtention on StackRouter {
  String? get previousRoutePath {
    if (stack.length > 1) {
      final previousRoute = stack[stack.length - 2];

      return previousRoute.routeData.name;
    } else {
      return null;
    }
  }
}
