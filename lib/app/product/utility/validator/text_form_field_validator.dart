import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/product/constant/reg_exps.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';

class TextFormFieldValidator {
  TextFormFieldValidator({this.value});

  final String? value;

  String? get getEmptyCheckValidator {
    if (value == null) {
      return null;
    } else {
      if (value == null || value!.trim().isEmpty) {
        return LocaleKeys.validate_directoryNameCannotEmpty.lang.tr;
      } else {
        return null;
      }
    }
  }

  String? get getUsableEmailValidator {
    if (value == null) {
      return null;
    } else {
      if (!RegExps.emailRegExp.hasMatch(value!)) {
        print('tetıklendı');
        return LocaleKeys.login_emailAdressNotCorrectFormat.lang.tr;
      } else {
        return null;
      }
    }
  }
}
