import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_colors.dart';

class CustomSelectorWidget extends StatelessWidget {
  final Function() onSelect;
  final List<String> items;
  final String label;

  const CustomSelectorWidget({
    super.key,
    required this.onSelect,
    required this.items,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColors.trueWhiteColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 2),
          )
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.smallBoldTextOnCardStyle(
                  color: AppColors.blackColor),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              hint: Text(
                label,
                style: AppTextStyles.appBarTitleTextStyle(
                    color: AppColors.formGreyColor),
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: onSelect(),
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.formGreyColor))),
            ),
          ],
        ));
  }
}
