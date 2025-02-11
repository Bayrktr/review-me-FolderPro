import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.text, this.callBack});

  final String? text;

  final VoidCallback? callBack;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: callBack,
        icon: Container(
          padding: EdgeInsets.symmetric(
            vertical: context.sized.dynamicWidth(
              0.03,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: context.theme.getColor.unSelectedWidgetColor,
                width: 0.2,
              ),),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: context.theme.getColor.unSelectedWidgetColor,
              ),
              Padding(
                padding: context.padding.veryLow,
              ),
              Text(
                text!.forNull.getGeneralNullMessage,
              ),
              // fixme saçma bir olay var burda
            ],
          ),
        ),);

    /*TextField(
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.theme.getColor.unSelectedWidgetColor,
            width: 0.2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        label:
      ),
      onTap: callBack,
    );

       */
  }
}
