import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor = AppColors.greenColor,
    this.textColor = AppColors.trueWhiteColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 38),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Text(
        label,
        style: AppTextStyles.labelTextButtonStyle(color: textColor),
      ),
    );
  }
}
