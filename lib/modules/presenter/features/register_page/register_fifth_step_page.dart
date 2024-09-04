import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_colors.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

import '../../../../consts/app_strings.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../widgets/appbar/custom_appbar_widget.dart';
import '../../widgets/background/background_widget.dart';
import '../../widgets/buttons/custom_green_elevated_button.dart';

class RegisterFifthStepPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appRegisterFifthStepPage;

  static navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const RegisterFifthStepPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;

    return BackgroundWidget(
      appBar: const CustomAppBarWidget(
        indicatorValue: 0.8,
        appBarType: AppBarType.stepsAndBackArrow,
      ),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          children: [
            const SizedBox(height: 130),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  fillColor: WidgetStateProperty.all(Colors.white),
                  side: const BorderSide(
                      color: AppColors.softGreyColor, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  tristate: true,
                  value: isChecked,
                  onChanged: (bool? value) {
                    isChecked = value;
                  },
                ),
                RichText(
                    text: TextSpan(
                        text: AppStrings.iHaveReadAndAgreeToThe,
                        style: AppTextStyles.bodyTextStyle(
                            color: AppColors.blackColor),
                        children: [
                      TextSpan(
                        text: AppStrings.privacySpacingPolicy,
                        style: AppTextStyles.underlinedTextButtonStyle(
                            color: AppColors.blackColor),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(text: AppStrings.and),
                      TextSpan(
                        text: AppStrings.userTerms,
                        style: AppTextStyles.underlinedTextButtonStyle(
                            color: AppColors.blackColor),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ])),
              ],
            ),
            const SizedBox(height: 52),
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
