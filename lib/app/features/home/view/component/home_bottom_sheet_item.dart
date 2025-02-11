import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeBottomSheetItem extends StatelessWidget {
  const HomeBottomSheetItem({
    required this.selectedIndex, required this.itemIndex, required this.title, super.key,
    this.iconData,
  });

  final int selectedIndex;
  final IconData? iconData;
  final int itemIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          context.tabsRouter.setActiveIndex(itemIndex);
        },
        child: Container(
          height: double.infinity,
          color: Colors.transparent,
          child: Column(
            children: [
              Icon(
                iconData,
                color: selectedIndex == itemIndex
                    ? context.theme.getColor.focusColor
                    : null,
                size: context.radius.veryLow,
              ),
              Text(
                title,
                style: TextStyle(
                  color: selectedIndex == itemIndex
                      ? context.theme.getColor.focusColor
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
