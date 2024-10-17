import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomSelectorWidget extends StatelessWidget {

  final Function(String) onSelect;
  final List<String> items;
  final String title;
  final String selectorHint;
  String? selectedValue;

  CustomSelectorWidget({
    super.key,
    required this.onSelect,
    required this.items,
    required this.title,
    required this.selectorHint,
    this.selectedValue
  });

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
                  title,
                  style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  value: selectedValue,
                  dropdownColor: AppColors.trueWhiteColor,
                  style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.blackColor),
                  hint: Text(
                    selectorHint,
                    style: AppTextStyles.appBarTitleTextStyle(
                        color: AppColors.formGreyColor),
                  ),
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                        value: item, child: Text(item));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      onSelect(value);
                    }
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
