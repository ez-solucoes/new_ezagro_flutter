import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_ezagro_flutter/core/enums/mask_type_enum.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../buttons/custom_elevated_button.dart';
import '../text_fields/custom_underlined_text_field.dart';

class PasswordFormWidget extends StatelessWidget {
  final bool isLoading;
  final String title;
  final String buttonText;
  final TextEditingController controller;
  final VoidCallback onButtonPressed;
  final bool passwordField;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;

  const PasswordFormWidget({
    super.key,
    required this.isLoading,
    required this.title,
    required this.controller,
    required this.buttonText,
    required this.onButtonPressed,
    required this.passwordField,
    this.inputType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 72),
        Text(
          title,
          style: AppTextStyles.titleTextStyle(color: AppColors.primaryBlackColor),
        ),
        const SizedBox(height: 67),
        CustomUnderlinedTextField(
          inputFormatters: inputFormatters,
          inputType: inputType,
          hintText: !passwordField ? maskString(MaskTypeEnum.cpf) : '',
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
