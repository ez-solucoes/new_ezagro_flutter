import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class AddressInfoCard extends StatelessWidget {
  final List<Map<String, dynamic>> addressInfo;
  final IconData? trailingIcon;
  final VoidCallback? onIconTap;

  const AddressInfoCard({
    super.key,
    required this.addressInfo,
    this.onIconTap,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...addressInfo.map((info) {
                    final label = info['label']?.toString() ?? '';
                    final value = info['value']?.toString() ?? '';

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
                          ),
                          Expanded(
                            child: Text(
                              value,
                              style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),

            if(trailingIcon != null)
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: onIconTap,
                  child: Icon(
                    trailingIcon,
                    size: 24,
                    color: AppColors.primaryBlackColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
