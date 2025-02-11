import 'dart:async';

import 'package:DocuSort/app/core/constant/settings.dart';
import 'package:DocuSort/app/product/bloc/deep_link/deep_link_repository.dart';
import 'package:DocuSort/app/product/bloc/deep_link/deep_link_state.dart';
import 'package:DocuSort/app/product/service/deepLink/query_parameters/file/file_query_parameters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinkCubit extends Cubit<DeepLinkState> {
  DeepLinkCubit() : super(DeepLinkState());

  late StreamSubscription _sub;

  final DeepLinkRepository _deepLinkRepository = DeepLinkRepository();

  Future<void> initDeepLinkHandling() async {
    _sub = uriLinkStream.listen(
      (Uri? uri) async {
        if (uri != null && uri.host == Settings.host) {
          final userId = uri.queryParameters[FileQueryParameters.id];
          if (userId != null) {
            final directoryId =
                uri.queryParameters[FileQueryParameters.directoryId];
            final fileId = uri.queryParameters[FileQueryParameters.fileId];
            await _handleFileOpen(
              directoryId: directoryId,
              fileId: fileId,
            );
          }
        }
      },
      onError: (err) {
        print('Deep link error: $err');
      },
    );

    // _checkInitialUri();
  }

  // fixme
  Future<void> _handleFileOpen({String? directoryId, String? fileId}) async {

    if (directoryId != null) {
      final response = await _deepLinkRepository.getDirectory(directoryId);
      if (response == null) return;
      emit(
        state.copyWith(
          navigate: DeepLinkNavigate.openDirectory,
          directoryModel: response,
        ),
      );
    } else if (fileId != null) {
    } else {
      print('hıc bır sey yakalanmadı');
    }
    resetNavigatedPages();
  }

  void resetNavigatedPages() {
    emit(
      state.copyWith(
        navigate: DeepLinkNavigate.initial,
      ),
    );
  }
}
