import 'package:flutter/material.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../buttons/custom_elevated_button.dart';
import '../buttons/custom_outlined_button.dart';

class LogoutDialog extends StatelessWidget {

  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.backgroundColor, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStringsPortuguese.logoutConfirmationMessage,
            textAlign: TextAlign.center,
            style: AppTextStyles.bottomSheetAlert(color: AppColors.primaryBlackColor),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomOutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: AppStringsPortuguese.cancelButtonLabel, textStyle: AppTextStyles.labelTextButtonStyle(color: AppColors.primaryBlackColor),
                customColor: AppColors.primaryBlackColor,
              ),
              CustomElevatedButton(
                onPressed: () {

                },
                label: AppStringsPortuguese.leaveButtonLabel,
                backgroundColor: AppColors.primaryRedColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
