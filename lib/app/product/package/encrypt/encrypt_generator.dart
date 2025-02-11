import 'package:encrypt/encrypt.dart' as encrypt;

final class EncrptGenerator {
  const EncrptGenerator(this._text, this._key);

  final String _text;
  final String _key;

  String get toEncrypt {
    final keyBytes = encrypt.Key.fromUtf8(_key);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(keyBytes));
    final encrypted = encrypter.encrypt(_text, iv: iv);
    return '${encrypted.base64}:${iv.base64}';
  }

  String get toDecrpyt {
    final parts = _text.split(':');
    final encryptedData = parts[0];
    final ivData = parts[1];

    final keyBytes = encrypt.Key.fromUtf8(_key);
    final iv = encrypt.IV.fromBase64(ivData);
    final encrypter = encrypt.Encrypter(encrypt.AES(keyBytes));

    final decrypted =
        encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedData), iv: iv);

    return decrypted;
  }
}
