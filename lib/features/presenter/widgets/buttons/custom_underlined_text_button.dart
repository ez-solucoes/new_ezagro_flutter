import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class CustomUnderlinedTextButton extends StatelessWidget {
  final Function() onTap;
  final String label;

  const CustomUnderlinedTextButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: AppTextStyles.underlinedTextButtonStyle(
            color: AppColors.primaryBlackColor),
      ),
    );
  }
}
