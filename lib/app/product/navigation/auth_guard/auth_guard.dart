import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';
import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {

  AuthGuard(this.firebaseAuth);
  final IFirebaseAuth firebaseAuth;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {

    if (!firebaseAuth.isUserNull) {
      resolver.next();
    } else {
      print('auth degıl');
    }
  }
}
