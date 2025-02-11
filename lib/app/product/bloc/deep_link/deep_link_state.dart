import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:equatable/equatable.dart';

class DeepLinkState with EquatableMixin {
  DeepLinkState({
    this.navigate = DeepLinkNavigate.initial,
    this.directoryModel,
  });

  final DeepLinkNavigate navigate;
  final BaseDirectoryModel? directoryModel;

  @override
  List<Object?> get props => [
    navigate,
        directoryModel,
      ];

  DeepLinkState copyWith(
          {DeepLinkNavigate? navigate, BaseDirectoryModel? directoryModel,}) =>
      DeepLinkState(
        navigate: navigate ?? this.navigate,
        directoryModel: directoryModel ?? this.directoryModel,
      );
}

enum DeepLinkNavigate {
  initial,
  openDirectory,
  openFile,
}
