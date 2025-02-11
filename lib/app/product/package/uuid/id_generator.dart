import 'dart:math';

import 'package:uuid/uuid.dart';

final class IdGenerator {
  const IdGenerator._();

  static const Uuid _uuid = Uuid();

  static String get randomStringId => _uuid.v4();

  static int get randomIntId {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomNum = Random().nextInt(1000);
    final uniqueId = timestamp + randomNum;
    return uniqueId;
  }

}
