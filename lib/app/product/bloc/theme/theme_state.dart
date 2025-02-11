import 'package:DocuSort/app/product/model/theme/theme_model.dart';
import 'package:equatable/equatable.dart';

class ThemeState with EquatableMixin {
  ThemeState({
    required this.themeModel, this.status = ThemeStatus.start,
  });

  final ThemeModel themeModel;

  final ThemeStatus status;

  @override
  List<Object?> get props => [
    themeModel,
        status,
      ];

  ThemeState copyWith({
    ThemeModel? themeModel,
    ThemeStatus? status,
  }) =>
      ThemeState(
        themeModel: themeModel ?? this.themeModel,
        status: status ?? this.status,
      );
}

enum ThemeStatus {
  initial,
  start,
}
