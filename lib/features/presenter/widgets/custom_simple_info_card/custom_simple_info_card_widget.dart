import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomSimpleInfoCardWidget extends StatelessWidget {
  final String label;
  final String data;

  const CustomSimpleInfoCardWidget({super.key, required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: AppColors.primaryWhiteColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
              ),
              SizedBox(height: 10),
              Text(
                data,
                style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
