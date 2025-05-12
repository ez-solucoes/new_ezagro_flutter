import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/drawables/app_drawables.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../modules/approvals_module/approvals_list/approvals_list_page.dart';

class CustomNotificationTileWidget extends StatelessWidget {
  final int totalNotification;
  final int totalUrgentNotifications;
  final String type;

  const CustomNotificationTileWidget({super.key, required this.totalNotification, required this.type, required this.totalUrgentNotifications});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ApprovalsListPage.navigate(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.primaryWhiteColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: AppColors.dividerGreyColor
              )
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(AppDrawables.approvalIcon, colorFilter: ColorFilter.mode(AppColors.primaryBlackColor, BlendMode.srcIn)),

              ),
              Expanded(
                child: Text(
                  notificationType(type),
                  style: AppTextStyles.labelTextButtonStyle(color: AppColors.primaryBlackColor),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreenColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  totalNotification.toString(),
                  style: AppTextStyles.labelTextButtonStyle(color: AppColors.primaryWhiteColor),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: AppColors.primaryRedColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  totalUrgentNotifications.toString(),
                  style: AppTextStyles.labelTextButtonStyle(color: AppColors.primaryWhiteColor),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  String notificationType(String type) {
    switch (type) {
      case 'purchaseRequest':
        return AppStringsPortuguese.pluralRequestTitle;
      case 'serviceOrder':
        return AppStringsPortuguese.pluralServicesOrderTitle;
      case 'approvals':
        return AppStringsPortuguese.pluralApprovalsTitle;
      default:
        return '';
    }
  }
}
