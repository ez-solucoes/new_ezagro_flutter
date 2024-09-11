import 'package:flutter/material.dart';
import '../../../../consts/app_colors.dart';
import '../../../../consts/app_text_styles.dart';

class CustomCheckableListItemWidget extends StatelessWidget {

  final bool indexIsChecked;
  final String firstColumn;
  final String secondColumn;
  final String thirdColumn;
  final int index;
  final Function(int) onCheckBoxTap;

  const CustomCheckableListItemWidget({
    super.key,
    this.indexIsChecked = false,
    required this.firstColumn,
    required this.secondColumn,
    required this.thirdColumn,
    required this.index,
    required this.onCheckBoxTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: index%2 == 0 ? AppColors.softGreenColor : AppColors.trueWhiteColor,
          border: const Border(
              bottom: BorderSide(
                  color: AppColors.contourWhiteColor,
                  width: 2.0
              )
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Checkbox(value: indexIsChecked, onChanged: onCheckBoxTap(index)),
          Text(firstColumn, style: AppTextStyles.appBarTitleTextStyle(color: AppColors.blackColor),),
          Text(secondColumn, style: AppTextStyles.appBarTitleTextStyle(color: AppColors.blackColor),),
          Text(thirdColumn, style: AppTextStyles.appBarTitleTextStyle(color: AppColors.blackColor),)
        ],
      ),
    );
  }
}
