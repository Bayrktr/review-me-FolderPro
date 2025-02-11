import 'package:DocuSort/app/product/model/user_account/user_account_model.dart';
import 'package:equatable/equatable.dart';

class UserAccountState with EquatableMixin {
  UserAccountState({
    this.userAccountModel,
  });

  final UserAccountModel? userAccountModel;

  bool get checkUser => userAccountModel == null ? false : true;

  @override
  List<Object?> get props => [userAccountModel];

  UserAccountState copyWith({
    UserAccountModel? userAccountModel,
  }) =>
      UserAccountState(
        userAccountModel: userAccountModel,
      );
}
