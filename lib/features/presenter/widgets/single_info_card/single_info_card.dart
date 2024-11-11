import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class SingleInfoCard extends StatelessWidget {
  const SingleInfoCard({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              title,
              style: AppTextStyles.boldMediumTextStyle(color: AppColors.primaryBlackColor),
            ),
          ),
          SizedBox( // Adiciona um SizedBox com largura infinita
            width: double.infinity,
            child: const Divider(height: 1, color: AppColors.borderWhiteColor,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Text(
              data,
              style: AppTextStyles.bodyTextStyle(color: AppColors.primaryBlackColor),
            ),
          ),
        ],
      ),
    );
  }
}