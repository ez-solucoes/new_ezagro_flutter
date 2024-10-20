import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

enum ListItemType { regular, oneIconButton, twoIconButtons }

class CustomListItemWidget extends StatelessWidget {
  final ListItemType type;

  final String label;
  final String informationText;
  final Color backgroundColor;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Function() onLeftIconTap;
  final Function() onRightIconTap;

  const CustomListItemWidget({
    super.key,
    this.label = "",
    this.informationText = "",
    required this.backgroundColor,
    this.leftIcon,
    this.rightIcon,
    this.onLeftIconTap = _defaultIconAction,
    this.onRightIconTap = _defaultIconAction,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: const Border(
              bottom:
                  BorderSide(color: AppColors.contourWhiteColor, width: 2.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildFirstColumn(), _buildSecondColumn()],
      ),
    );
  }

  Widget _buildFirstColumn() {
    switch (type) {
      case ListItemType.regular || ListItemType.oneIconButton:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:
                  AppTextStyles.labelOnCardStyle(color: AppColors.blackColor),
            ),
            Text(
              informationText,
              style: AppTextStyles.smallBoldTextOnCardStyle(
                  color: AppColors.blackColor),
            )
          ],
        );
      case ListItemType.twoIconButtons:
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            informationText,
            style: AppTextStyles.cardBodyTextStyle(color: AppColors.blackColor),
          )
        ]);
    }
  }

  Widget _buildSecondColumn() {
    switch (type) {
      case ListItemType.regular:
        return const SizedBox.shrink();
      case ListItemType.oneIconButton:
        return Column(children: [
          IconButton(
            onPressed: onRightIconTap,
            icon: Icon(rightIcon),
          )
        ]);
      case ListItemType.twoIconButtons:
        return Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: onLeftIconTap, icon: Icon(leftIcon)),
                IconButton(onPressed: onRightIconTap, icon: Icon(rightIcon))
              ],
            )
          ],
        );
    }
  }

  static void _defaultIconAction() {}
}
