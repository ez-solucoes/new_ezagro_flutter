import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../../consts/app_colors.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/textFields/custom_pinput_text_field.dart';

class RegisterSecondStepPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appRegisterSecondStepPage;

  static navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const RegisterSecondStepPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: const CustomAppBarWidget(
        indicatorValue: 0.8,
        appBarType: AppBarType.stepsAndBackArrow,
      ),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 72),
            const Text(
              AppStrings.weSentTheConfirmationCodeToYourPhone,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.blackColor),
            ),
            const SizedBox(height: 18),
            Text(
              AppStrings.typeTheNumberBellow,
              textAlign: TextAlign.start,
              style:
                  AppTextStyles.subTitleTextStyle(color: AppColors.blackColor),
            ),
            const SizedBox(height: 18),
            Center(
              child: CustomPinputTextField(
                onComplete: (pin) {},
              ),
            ),
            const SizedBox(height: 51),
            Center(
              child: CustomElevatedButton(
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
