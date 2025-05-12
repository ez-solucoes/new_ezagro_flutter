import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/register_page/register_second_step_page.dart';

import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/custom_forms/password_form_widget.dart';
import '../authentication_controller/authentication_controller.dart';

class RegisterFirstStepPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appRegisterFirstStepPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push() =>
      Modular.to.pushNamed(routePath);

  const RegisterFirstStepPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthenticationController>();
    final TextEditingController textController = TextEditingController();

    return BackgroundWidget(
      appBar: const CustomAppBarWidget(
        indicatorValue: 0.33,
        appBarType: AppBarType.stepsAndBackArrow,
      ),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: PasswordFormWidget(
          isLoading: controller.isLoading,
          title: AppStringsPortuguese.createNewPasswordString,
          controller: textController,
          buttonText: AppStringsPortuguese.forwardString,
          onButtonPressed: () {
            controller.password = textController.text;
            RegisterSecondStepPage.navigate();
          },
          passwordField: true,
        ),
      ),
    );
  }
}
