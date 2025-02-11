import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/product/component/image/custom_image.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/enum/icons_enum.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.getColor.unSelectedWidgetColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imageFrom: ImageFrom.ASSET,
              imageType: ImageType.PNG,
              assetPath: IconsEnum.google.toPng,
              height: context.sized.widthHighValue,
              width: context.sized.widthHighValue,
            ),
            Padding(padding: context.padding.low),
            const LocaleText(
              color: Colors.white,
              text: LocaleKeys.login_continueWithGoggle,
            ),
          ],
        ),
      ),
    );
  }
}
