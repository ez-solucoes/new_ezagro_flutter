import 'package:flutter/material.dart';

import '../../../../design_system/typography/app_text_styles.dart';

class CustomOutlinedIconButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final IconData icon;
  final Color iconColor;

  const CustomOutlinedIconButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 38),
            backgroundColor: backgroundColor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: borderColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            Text(label, style: AppTextStyles.labelTextButtonStyle(color: textColor)),
          ],
        )
    );
  }
}
