import 'package:DocuSort/app/product/bloc/user_account/user_account_state.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAccountCubit extends Cubit<UserAccountState> {
  UserAccountCubit(this._firebaseAuth) : super(UserAccountState()) {
    _firebaseAuth.userStream.listen(
      (userAccountModel) {
        emit(UserAccountState(userAccountModel: userAccountModel));
      },
    );
  }

  final IFirebaseAuth _firebaseAuth;
}
