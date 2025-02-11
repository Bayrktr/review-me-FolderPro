import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum IconsEnum {
  google('google'),
  folder('folder'),
  favoriteFolder('favoriteFolder'),
  whiteFolder('white_folder'),
  cloud('cloud'),
  file('file')
  ;

  final String value;

  const IconsEnum(this.value);

  String get toPng => 'asset/image/icons/$value.png';

  String get toSvg => 'asset/image/icons/$value.svg';

  Image get toImageAsset => Image.asset(toPng);

  SvgPicture get toSvgAsset => SvgPicture.asset(toSvg);
}
