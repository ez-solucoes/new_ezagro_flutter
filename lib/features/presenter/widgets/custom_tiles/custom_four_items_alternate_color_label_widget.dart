import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomFourItemsAlternateColorLabelWidget extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final String thirdLabel;
  final String fourthLabel;

  const CustomFourItemsAlternateColorLabelWidget({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.thirdLabel,
    required this.fourthLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            firstLabel,
            style: AppTextStyles.smallBoldTextOnCardStyle(
                color: AppColors.primaryBlackColor),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            secondLabel,
            style: AppTextStyles.smallBoldTextOnCardStyle(
                color: AppColors.primaryBlackColor),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            thirdLabel,
            style: AppTextStyles.smallBoldTextOnCardStyle(
                color: AppColors.primaryBlackColor),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            fourthLabel,
            style: AppTextStyles.smallBoldTextOnCardStyle(
                color: AppColors.primaryBlackColor),
          ),
        ),
      ],
    );
  }
}
