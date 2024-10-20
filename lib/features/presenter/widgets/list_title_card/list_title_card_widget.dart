import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class ListTitleCardWidget extends StatelessWidget {
  final String text;
  final Color borderColor;

  const ListTitleCardWidget(
      {super.key,
      required this.text,
      this.borderColor = AppColors.whiteBorderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.trueWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                text,
                style:
                    AppTextStyles.labelOnCardStyle(color: AppColors.blackColor),
              )),
          Divider(
            color: borderColor,
            thickness: 1.0,
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
