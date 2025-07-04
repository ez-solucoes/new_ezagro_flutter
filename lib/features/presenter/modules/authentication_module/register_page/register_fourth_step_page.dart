import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';

import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/text_fields/custom_underlined_text_field.dart';

class RegisterFourthStepPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appRegisterFourthStepPage;

  static void navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static Future<Object?> push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const RegisterFourthStepPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: const CustomAppBarWidget(
        indicatorValue: 0.8,
        appBarType: AppBarType.stepsAndBackArrow,
      ),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 72),
            Text(
              AppStringsPortuguese.retypeYourPassword,
              style: AppTextStyles.titleTextStyle(color: AppColors.primaryBlackColor),
            ),
            const SizedBox(height: 67),
            CustomUnderlinedTextField(
              onPressed: () {},
              controller: TextEditingController(),
              passwordField: true,
            ),
            const SizedBox(height: 40),
            Center(
              child: CustomElevatedButton(
                onPressed: () {},
                label: AppStringsPortuguese.forwardString,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
