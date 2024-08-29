import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomOutlinedTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  const CustomOutlinedTextFormField({
    super.key,
    required this.controller,
    required this.label,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.labelTextFieldStyle(color: AppColors.greyColor),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}