import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomCheckableListItemWidget extends StatelessWidget {
  final bool isChecked;
  final bool isHeader;
  final String firstColumn;
  final String secondColumn;
  final String thirdColumn;
  final int index;
  final Function(int) onCheckBoxTap;

  const CustomCheckableListItemWidget({
    super.key,
    this.isHeader = false,
    this.isChecked = false,
    required this.firstColumn,
    required this.secondColumn,
    required this.thirdColumn,
    required this.index,
    required this.onCheckBoxTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCheckBoxTap(index);
      },
      child: Container(
        padding: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? AppColors.primaryWhiteColor
              : AppColors.softGreenColor,
          border: const Border(
            bottom: BorderSide(
              color: AppColors.borderWhiteColor,
              width: 2.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isHeader ? true : isChecked,
                  activeColor: AppColors.primaryGreenColor,
                  onChanged: (bool? value) {
                      onCheckBoxTap(index);
                  },
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        firstColumn,
                        style: isHeader
                            ? AppTextStyles.smallBoldTextOnCardStyle(
                            color: AppColors.primaryBlackColor)
                            : AppTextStyles.cardBodyTextStyle(
                            color: AppColors.primaryBlackColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        secondColumn,
                        style: isHeader
                            ? AppTextStyles.smallBoldTextOnCardStyle(
                            color: AppColors.primaryBlackColor)
                            : AppTextStyles.cardBodyTextStyle(
                            color: AppColors.primaryBlackColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        thirdColumn,
                        style: isHeader
                            ? AppTextStyles.smallBoldTextOnCardStyle(
                            color: AppColors.primaryBlackColor)
                            : AppTextStyles.cardBodyTextStyle(
                            color: AppColors.primaryBlackColor),
                        textAlign: TextAlign.center,
                      ),
                    ].map((e) => Expanded(child: e)).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}