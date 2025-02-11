import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import '../../../../design_system/colors/app_colors.dart';

class SingleInformationCard extends StatelessWidget {
  const SingleInformationCard({
    super.key,
    required this.titleOne,
    required this.titleTwo,
    required this.information,
  });

  final String titleOne;
  final String titleTwo;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titleOne,
                  style: AppTextStyles.labelOnCardStyle(
                      color: AppColors.primaryBlackColor),
                ),
                Text(
                  titleTwo,
                  style: AppTextStyles.labelOnCardStyle(
                      color: AppColors.primaryBlackColor),
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
            child: Text(
              information,
              style: AppTextStyles.bodyTextStyle(
                  color: AppColors.primaryBlackColor),
            ),
          ),
        ],
      ),
    );
  }
}