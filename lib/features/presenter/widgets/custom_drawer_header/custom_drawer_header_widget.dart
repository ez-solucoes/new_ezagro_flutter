import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class CustomDrawerHeaderWidget extends StatelessWidget {
  const CustomDrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          CircleAvatar(radius: 20),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome',
                style: AppTextStyles.boldMediumTextStyle(
                    color: AppColors.whiteColor),
              ),
              Text(
                'xxx.xxxxx',
                style: AppTextStyles.boldMediumTextStyle(
                    color: AppColors.whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
