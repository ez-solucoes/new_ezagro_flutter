import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomSelectorWidget extends StatefulWidget {
  final Function() onSelect;
  final List<String> items;
  final String title;
  final String selectorHint;

  const CustomSelectorWidget({
    super.key,
    required this.onSelect,
    required this.items,
    required this.title,
    required this.selectorHint
  });

  @override
  State<CustomSelectorWidget> createState() => _CustomSelectorWidgetState();

}

class _CustomSelectorWidgetState extends State<CustomSelectorWidget> {

  @override
  Widget build(BuildContext context) {
    String? selectorValue;
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
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  value: selectorValue,
                  dropdownColor: AppColors.softGreenColor,
                  style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.blackColor),
                  hint: Text(
                    widget.selectorHint,
                    style: AppTextStyles.appBarTitleTextStyle(
                        color: AppColors.formGreyColor),
                  ),
                  items: widget.items.map((String item) {
                    return DropdownMenuItem<String>(
                        value: item, child: Text(item));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectorValue = value;
                    });
                  },
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.formGreyColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.greenColor)),
                  )
                ),
              ],
            )));
  }
}
