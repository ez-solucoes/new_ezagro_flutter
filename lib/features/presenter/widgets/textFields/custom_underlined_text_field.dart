import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomUnderlinedTextField extends StatefulWidget {
  final Function() onPressed;
  final String? hintText;
  final TextEditingController controller;
  final bool passwordField;

  const CustomUnderlinedTextField(
      {super.key,
      required this.onPressed,
      required this.controller,
      this.hintText,
      required this.passwordField});

  @override
  State<CustomUnderlinedTextField> createState() =>
      _CustomUnderlinedTextFieldState();
}

class _CustomUnderlinedTextFieldState extends State<CustomUnderlinedTextField> {
  @override
  Widget build(BuildContext context) {
    bool sufixIconPressed = false;

    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          hintStyle: AppTextStyles.hintTextFieldTextStyle(
              color: AppColors.softGreyColor),
          border: const UnderlineInputBorder(),
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
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyColor))),
    );
  }
}
