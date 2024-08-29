import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';
import 'package:pinput/pinput.dart';

import '../../../../consts/app_colors.dart';

class CustomPinputTextField extends StatelessWidget {
  final Function(String) onComplete;
  const CustomPinputTextField({
    super.key,
    required this.onComplete
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
      defaultPinTheme: PinTheme(
        width: 55,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        textStyle: AppTextStyles.titleTextStyle(color: AppColors.blackColor),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.softGreyColor),
        ),
      ),
      showCursor: true,
      onCompleted: onComplete,
    );
  }
}