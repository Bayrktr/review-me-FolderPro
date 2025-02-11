import 'package:DocuSort/app/core/extention/string/general_string_extention.dart';
import 'package:DocuSort/app/core/extention/string/lang_extention.dart';

extension StringExtension on String {
  LangExtension get lang => LangExtension(this);

  GeneralStringExtension get general => GeneralStringExtension(this);

}


