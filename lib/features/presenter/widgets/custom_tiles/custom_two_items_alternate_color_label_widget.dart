import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomTwoItemsAlternateColorLabelWidget extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;

  const CustomTwoItemsAlternateColorLabelWidget({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            firstLabel,
            style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            secondLabel,
            style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
          ),
        ),
      ],
    );
  }
}
