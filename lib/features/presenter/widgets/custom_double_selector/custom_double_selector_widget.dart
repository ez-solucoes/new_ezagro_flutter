import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomDoubleSelectorWidget extends StatefulWidget {
  final Function(String) onSelectFirst;
  final List<String> itemsOne;
  final String titleOne;
  final String selectorHintOne;
  final Function(String) onSelectSecond;
  final List<String> itemsTwo;
  final String titleTwo;
  final String selectorHintTwo;

  const CustomDoubleSelectorWidget(
      {super.key,
      required this.onSelectFirst,
      required this.itemsOne,
      required this.titleOne,
      required this.selectorHintOne,
      required this.onSelectSecond,
      required this.itemsTwo,
      required this.titleTwo,
      required this.selectorHintTwo});

  @override
  State<CustomDoubleSelectorWidget> createState() =>
      _CustomDoubleSelectorWidgetState();
}

class _CustomDoubleSelectorWidgetState
    extends State<CustomDoubleSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    String? selectorValueOne;
    String? selectorValueTwo;
    return Card(
        color: AppColors.trueWhiteColor,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titleOne,
                  style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                    value: selectorValueOne,
                    dropdownColor: AppColors.trueWhiteColor,
                    style: AppTextStyles.appBarSubTitleTextStyle(
                        color: AppColors.blackColor),
                    hint: Text(
                      widget.selectorHintOne,
                      style: AppTextStyles.appBarTitleTextStyle(
                          color: AppColors.formGreyColor),
                    ),
                    items: widget.itemsOne.map((String item) {
                      return DropdownMenuItem<String>(
                          value: item, child: Text(item));
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        widget.onSelectFirst(value);
                      }
                      setState(() {
                        selectorValueOne = value;
                      });
                    },
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.formGreyColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greenColor)),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.titleTwo,
                  style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                    value: selectorValueTwo,
                    dropdownColor: AppColors.trueWhiteColor,
                    style: AppTextStyles.appBarSubTitleTextStyle(
                        color: AppColors.blackColor),
                    hint: Text(
                      widget.selectorHintTwo,
                      style: AppTextStyles.appBarTitleTextStyle(
                          color: AppColors.formGreyColor),
                    ),
                    items: widget.itemsTwo.map((String item) {
                      return DropdownMenuItem<String>(
                          value: item, child: Text(item));
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        widget.onSelectSecond(value);
                      }
                      setState(() {
                        selectorValueTwo = value;
                      });
                    },
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.formGreyColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greenColor)),
                    ))
              ],
            )));
  }
}
