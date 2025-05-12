import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
enum LabelStyle {
  finished,
  paused,
  pending,
  suspended,
  canceled,
  inProgress,
}

class CustomStatusLabel extends StatelessWidget {
  final LabelStyle style;
  final String text;

  const CustomStatusLabel({super.key, required this.style, required this.text});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Color borderColor = Colors.transparent;
    double borderWidth = 0.0;

    switch (style) {
      case LabelStyle.finished:
        backgroundColor = AppColors.primaryGreenColor;
        textColor = Colors.white;
        break;
      case LabelStyle.paused:
        backgroundColor = AppColors.muddyYellowColor;
        textColor = Colors.white;
        break;
      case LabelStyle.pending:
        backgroundColor = Colors.transparent;
        textColor = AppColors.primaryBlackColor;
        borderColor = AppColors.primaryBlackColor;
        borderWidth = 1.0;
        break;
      case LabelStyle.suspended:
        backgroundColor = AppColors.darkGreyColor;
        textColor = Colors.white;
        break;
      case LabelStyle.canceled:
        backgroundColor = AppColors.primaryRedColor;
        textColor = Colors.white;
        break;
      case LabelStyle.inProgress:
        backgroundColor = AppColors.brighterGreenColor;
        textColor = AppColors.primaryBlackColor;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: borderColor , width: borderWidth),
      ),
      child: Text(
        text,
        style: AppTextStyles.boldSmallLabelStyle(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}