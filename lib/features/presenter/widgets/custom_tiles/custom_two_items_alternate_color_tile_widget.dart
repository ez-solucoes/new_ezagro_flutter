import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../miscellaneous/item_selection_controller.dart';

class CustomTwoItemsAlternateColorTileWidget extends StatelessWidget {
  final int index;
  final String firstItem;
  final String secondItem;
  final ItemType itemType;

  const CustomTwoItemsAlternateColorTileWidget(
      {super.key, required this.index, required this.firstItem, required this.secondItem, required this.itemType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: index % 2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Expanded(
              flex: itemType == ItemType.product ? 4 : 2,
              child: Text(
                firstItem,
                style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              flex: (itemType == ItemType.product || itemType == ItemType.plot) ? 1 : 2,
              child: Text(
                secondItem,
                style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
