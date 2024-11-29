import 'package:flutter/material.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../buttons/custom_elevated_button.dart';
import '../buttons/custom_outlined_button.dart';

class LogoutBottomSheet extends StatelessWidget {

  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.35,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStringsPortuguese.logoutConfirmationMessage,
              style: AppTextStyles.bottomSheetAlert(color: AppColors.primaryBlackColor),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomOutlinedButton(
                  onPressed: () {

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
      ),);
  }

}
