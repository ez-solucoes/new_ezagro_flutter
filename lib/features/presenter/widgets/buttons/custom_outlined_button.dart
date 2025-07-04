import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final TextStyle textStyle;
  final Color? customColor;

  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.textStyle,
      this.customColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(120, 38),
          backgroundColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: customColor ?? AppColors.dividerGreyColor, width: 1),
              borderRadius: BorderRadius.circular(5)),
          shadowColor: AppColors.transparent),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
