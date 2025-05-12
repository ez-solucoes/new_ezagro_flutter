import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomTwoItemsAlternateColorEditWidget extends StatelessWidget {
  final int index;
  final String firstItem;
  final String secondItem;
  final Function() addQuantity;
  final Function() removeQuantity;

  const CustomTwoItemsAlternateColorEditWidget({
    super.key,
    required this.index,
    required this.firstItem,
    required this.secondItem,
    required this.addQuantity,
    required this.removeQuantity,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      color: index % 2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              firstItem,
              style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.formGreyColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    onPressed: removeQuantity,
                    icon: Icon(Icons.remove),
                    color: AppColors.primaryBlackColor,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.primaryBlackColor),
                  ),
                  child: Center(
                    child: Text(
                      secondItem,
                      style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.formGreyColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    onPressed: addQuantity,
                    icon: Icon(Icons.add),
                    color: AppColors.primaryBlackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
