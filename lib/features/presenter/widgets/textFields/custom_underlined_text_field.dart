import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomUnderlinedTextField extends StatelessWidget {
  final Function() onPressed;
  final String? hintText;
  final TextEditingController controller;

  const CustomUnderlinedTextField({super.key, required this.onPressed, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? '',
          hintStyle: AppTextStyles.hintTextFieldTextStyle(color: AppColors.softGreyColor),
          border: const UnderlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.visibility_outlined,
                color: AppColors.greyColor,
              )),
          focusedBorder:
              const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.greyColor))),
    );
  }
}
