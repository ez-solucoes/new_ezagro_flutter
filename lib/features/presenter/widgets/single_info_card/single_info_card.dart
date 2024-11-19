import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class BoldTitleInfoCard extends StatelessWidget {
  const BoldTitleInfoCard({
    super.key,
    required this.titleOne,
    required this.dataOne,
    this.titleTwo,
    this.dataTwo,
  });

  final String titleOne;
  final String dataOne;
  final String? titleTwo;
  final String? dataTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui o espaço entre os títulos
              children: [
                Text(
                  titleOne,
                  style: AppTextStyles.boldMediumTextStyle(
                      color: AppColors.primaryBlackColor),
                ),
                if (titleTwo != null)
                  Text(
                    titleTwo!,
                    style: AppTextStyles.boldMediumTextStyle(
                        color: AppColors.primaryBlackColor),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: const Divider(
              height: 1,
              color: AppColors.borderWhiteColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dataOne,
                  style: AppTextStyles.bodyTextStyle(
                      color: AppColors.primaryBlackColor),
                ),
                if (titleTwo != null)
                  Text(
                    dataTwo ?? "",
                    style: AppTextStyles.bodyTextStyle(
                        color: AppColors.primaryBlackColor),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}