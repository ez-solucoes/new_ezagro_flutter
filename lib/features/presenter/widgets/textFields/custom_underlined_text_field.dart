import 'package:flutter/material.dart';

import '../../../../consts/app_colors.dart';

class CustomUnderlinedTextField extends StatelessWidget {
  final Function() onPressed;
  final TextEditingController controller;

  const CustomUnderlinedTextField({super.key, required this.onPressed, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
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
