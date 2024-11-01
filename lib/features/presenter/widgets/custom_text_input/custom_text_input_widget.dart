import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class CustomTextInputWidget extends StatefulWidget {
  final String title;
  final Function(String) getText;

  const CustomTextInputWidget(
      {super.key, required this.title, required this.getText});

  @override
  State<CustomTextInputWidget> createState() => _CustomTextInputWidgetState();
}

class _CustomTextInputWidgetState extends State<CustomTextInputWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.primaryWhiteColor,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.primaryBlackColor),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: AppColors.primaryGreenColor,
                  controller: _controller,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.formGreyColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryGreenColor)),
                      hoverColor: AppColors.primaryGreenColor),
                  onEditingComplete: () {
                    widget.getText(_controller.text);
                  },
                )
              ],
            )));
  }
}
