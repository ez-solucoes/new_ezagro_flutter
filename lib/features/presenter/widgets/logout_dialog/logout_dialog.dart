import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/authentication_controller/authentication_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/login_pages/login_page.dart';
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
      padding: EdgeInsets.symmetric(vertical: 65, horizontal: 15),
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
          const SizedBox(height: 55),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: AppStringsPortuguese.cancelButtonLabel,
                textStyle: AppTextStyles.labelTextButtonStyle(color: AppColors.primaryBlackColor),
                customColor: AppColors.primaryBlackColor,
              ),
              const SizedBox(width: 10),
              CustomElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  

                  final authController = Modular.get<AuthenticationController>();
                  await authController.logout();

                  Modular.to.navigate(LoginPage.routePath);
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
