import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_strings.dart';
import '../../../consts/app_text_styles.dart';
import '../widgets/appbar/custom_appbar_widget.dart';
import '../widgets/background/background_widget.dart';
import '../widgets/buttons/custom_green_elevated_button.dart';
import '../widgets/textFields/custom_underlined_text_field.dart';

class RegisterFourthStepPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appRegisterFourthStepPage;

  static navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static push(ArgParams args) =>
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
              AppStrings.retypeYourPassword,
              style: AppTextStyles.titleTextStyle(color: AppColors.blackColor),
            ),
            const SizedBox(height: 67),
            CustomUnderlinedTextField(
              onPressed: () {},
              controller: TextEditingController(),
            ),
            const SizedBox(height: 40),
            Center(
              child: CustomGreenElevatedButton(
                onPressed: () {},
                label: AppStrings.forwardString,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
