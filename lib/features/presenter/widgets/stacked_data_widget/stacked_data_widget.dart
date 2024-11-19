import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class StackedDataWidget extends StatelessWidget {
  const StackedDataWidget({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          child: const VerticalDivider(
            width: 1,
            color: AppColors.borderWhiteColor,
          ),
        ),
        const SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.labelOnCardStyle(
                  color: AppColors.primaryBlackColor),
            ),
            Text(
              text,
              style: AppTextStyles.bodyCardTextStyle(
                  color: AppColors.primaryBlackColor),
            ),
          ],
        ),
      ],
    );
  }
}