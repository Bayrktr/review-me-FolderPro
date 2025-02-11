import 'package:DocuSort/app/core/constant/settings.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';


final class NullCheckExtension {

  NullCheckExtension(String? value) : _string = value;
  final String? _string;

  String get getImageNotFoundAsset {
    if (_string == null) {
      return '${Settings.assetPath}image/error/image_not_found';
    } else {
      return _string;
    }
  }

  String get getGeneralNullMessage {
    if (_string == null) {
      return LocaleKeys.errors_nullErrorMessage.lang.tr;
    } else {
      return _string;
    }
  }
}
