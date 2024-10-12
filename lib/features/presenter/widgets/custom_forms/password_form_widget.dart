import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/core/enums/mask_type_enum.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_text_styles.dart';
import '../buttons/custom_elevated_button.dart';
import '../textFields/custom_underlined_text_field.dart';

class PasswordFormWidget extends StatelessWidget {
  final bool isLoading;
  final String title;
  final String buttonText;
  final TextEditingController controller;
  final VoidCallback onButtonPressed;
  final bool passwordField;

  const PasswordFormWidget({
    super.key,
    required this.isLoading,
    required this.title,
    required this.controller,
    required this.buttonText,
    required this.onButtonPressed,
    required this.passwordField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 72),
        Text(
          title,
          style: AppTextStyles.titleTextStyle(color: AppColors.blackColor),
        ),
        const SizedBox(height: 67),
        CustomUnderlinedTextField(
          hintText: !passwordField
              ? maskString(MaskTypeEnum.cpf)
              : '',
          onPressed: () {},
          controller: controller,
          passwordField: passwordField,
        ),
        const SizedBox(height: 40),
        Center(
          child: CustomElevatedButton(
            onPressed: onButtonPressed,
            label: buttonText,
            isLoading: isLoading,
          ),
        ),
      ],
    );
  }
}
