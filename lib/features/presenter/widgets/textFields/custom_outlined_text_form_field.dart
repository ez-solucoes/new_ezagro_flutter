import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';
import '../../../../consts/app_colors.dart';

class CustomOutlinedTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool passwordField;

  const CustomOutlinedTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.inputType,
    this.inputFormatters,
    required this.passwordField,
  });

  @override
  State<CustomOutlinedTextFormField> createState() =>
      _CustomOutlinedTextFormFieldState();
}

class _CustomOutlinedTextFormFieldState
    extends State<CustomOutlinedTextFormField> {
  bool sufixIconPressed = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.inputType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle:
            AppTextStyles.labelTextFieldStyle(color: AppColors.greyColor),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(5),
        ),
        suffixIcon: widget.passwordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    sufixIconPressed = !sufixIconPressed;
                  });
                },
                icon: sufixIconPressed
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: (widget.passwordField && !sufixIconPressed),
    );
  }
}
