import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomTextInputWidget extends StatefulWidget {
  final String title;

  const CustomTextInputWidget({
    super.key,
    required this.title
  });

  @override
  State<CustomTextInputWidget> createState() => _CustomTextInputWidgetState();

}

class _CustomTextInputWidgetState extends State<CustomTextInputWidget> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.trueWhiteColor,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: AppColors.greenColor,
                  controller: _controller,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.formGreyColor)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
                      color: AppColors.greenColor
                    )),
                    hoverColor: AppColors.greenColor
                  ),
                )
              ],
            )));
  }
}
