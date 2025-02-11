import 'dart:io'; // For file images
import 'dart:typed_data'; // For memory images

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImage extends StatelessWidget {

  const CustomImage({
    required this.imageFrom,
    required this.imageType,
    super.key,
    this.assetPath,
    this.networkUrl,
    this.file,
    this.memoryImage,
    this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : assert(
          (imageFrom == ImageFrom.ASSET && assetPath != null) ||
              (imageFrom == ImageFrom.NETWORK && networkUrl != null) ||
              (imageFrom == ImageFrom.FILE && file != null) ||
              (imageFrom == ImageFrom.MEMORY && memoryImage != null),
          'Correct parameters must be provided for the selected image source',
        );
  final ImageFrom imageFrom;
  final ImageType imageType;
  final String? assetPath;
  final String? networkUrl;
  final File? file;
  final Uint8List? memoryImage;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.PNG:
        switch (imageFrom) {
          case ImageFrom.ASSET:
            return Image.asset(
              assetPath!,
              height: height,
              width: width,
            ); // assetPath is required if ASSET
          case ImageFrom.NETWORK:
            return Image.network(
              networkUrl!,
              height: height,
              width: width,
            ); // networkUrl is required if NETWORK
          case ImageFrom.FILE:
            return Image.file(
              file!,
              height: height,
              width: width,
            ); // file is required if FILE
          case ImageFrom.MEMORY:
            return Image.memory(
              memoryImage!,
              height: height,
              width: width,
            ); // memoryImage is required if MEMORY
          default:
            return const SizedBox
                .shrink(); // Fallback to an empty widget if nothing is provided
        }
      case ImageType.SVG:
        switch (imageFrom) {
          case ImageFrom.ASSET:
            return SvgPicture.asset(
              assetPath!,
              height: height,
              width: width,
            );
          case ImageFrom.NETWORK:
            return SvgPicture.network(
              networkUrl!,
              height: height,
              width: width,
            );
          case ImageFrom.FILE:
            return SvgPicture.file(
              file!,
              height: height,
              width: width,
            );
          case ImageFrom.MEMORY:
            return SvgPicture.memory(
              memoryImage!,
              height: height,
              width: width,
            );
        }
    }
  }
}

enum ImageFrom { ASSET, NETWORK, FILE, MEMORY }

enum ImageType { PNG, SVG }
