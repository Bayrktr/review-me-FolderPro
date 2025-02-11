import 'package:DocuSort/app/core/extention/string/null_check_extention.dart';

extension NullStringExtention on String? {
  NullCheckExtension get forNull => NullCheckExtension(this);
}