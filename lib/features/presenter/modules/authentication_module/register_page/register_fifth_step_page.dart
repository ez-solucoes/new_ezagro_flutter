import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/documents/documents_page/documents_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/home/home_page.dart';

import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';

class RegisterFifthStepPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appRegisterFifthStepPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const RegisterFifthStepPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;

    return BackgroundWidget(
      appBar: const CustomAppBarWidget(
        indicatorValue: 1.0,
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
                      color: AppColors.dividerGreyColor, width: 1),
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
                        text: AppStringsPortuguese.iHaveReadAndAgreeToThe,
                        style: AppTextStyles.bodyTextStyle(
                            color: AppColors.primaryBlackColor),
                        children: [
                      TextSpan(
                        text: AppStringsPortuguese.privacySpacingPolicy,
                        style: AppTextStyles.underlinedTextButtonStyle(
                            color: AppColors.primaryBlackColor),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          ArgParams args = ArgParams(firstArgs: AppStringsPortuguese.privacyPolicy);
                          DocumentsPage.navigate(args);
                        },
                      ),
                      const TextSpan(text: AppStringsPortuguese.and),
                      TextSpan(
                        text: AppStringsPortuguese.userTerms,
                        style: AppTextStyles.underlinedTextButtonStyle(
                            color: AppColors.primaryBlackColor),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          ArgParams args = ArgParams(firstArgs: AppStringsPortuguese.userTerms);
                          DocumentsPage.navigate(args);
                        },
                      ),
                    ])),
              ],
            ),
            const SizedBox(height: 52),
            Center(
              child: CustomElevatedButton(
                onPressed: () {
                  if(isChecked!){
                    HomePage.navigate();
                  }else {
                    CustomSnackBarWidget.show(SnackBarType.error, context, 'Para Continuar é necessário aceitar os\n${AppStringsPortuguese.userTerms}\ne a ${AppStringsPortuguese.privacyPolicy}');
                  }
                },
                label: AppStringsPortuguese.forwardString,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
