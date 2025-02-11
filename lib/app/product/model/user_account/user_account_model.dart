import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_account_model.freezed.dart';
part 'user_account_model.g.dart';

@freezed
class UserAccountModel with _$UserAccountModel {
  factory UserAccountModel({
    String? uid,
    String? name,
    String? email,
    @Default(false) bool isVerified,
  }) = _DirectoryModel;

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountModelFromJson(json);

  UserAccountModel._();
}
