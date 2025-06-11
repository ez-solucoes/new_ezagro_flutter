import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final IconData? icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool? isLoading;

  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.label,
        this.icon,
      this.isLoading,
      this.backgroundColor = AppColors.primaryGreenColor,
      this.borderColor = Colors.transparent,
      this.textColor = AppColors.primaryWhiteColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(120, 38),
            backgroundColor: backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: borderColor))),
        child: !(isLoading ?? false)
            ? Text(
                label,
                style: AppTextStyles.labelTextButtonStyle(color: textColor),
              )
            : Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircularProgressIndicator(
                  color: AppColors.backgroundColor,
                ),
              ));
  }
}
