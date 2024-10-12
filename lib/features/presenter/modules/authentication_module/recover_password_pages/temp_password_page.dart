import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/new_password_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_forms/password_form_widget.dart';

import '../authentication_controller/authentication_controller.dart';

class TempPasswordPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appTempPasswordPage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);

  const TempPasswordPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthenticationController>();
    final TextEditingController textController = TextEditingController();

    return BackgroundWidget(
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.stepsAndBackArrow,
          indicatorValue: 0.50,
        ),
        scrollable: true,
        child: Padding(
          padding: const EdgeInsets.all(19),
          child: PasswordFormWidget(
            isLoading: controller.isLoading,
            title: AppStrings.tempPassword,
            controller: textController,
            buttonText: AppStrings.forwardString,
            onButtonPressed: () {
              controller.temporaryPassword = textController.text;
              NewPasswordPage.push();
            },
            passwordField: true,
          ),
        ));
  }
}
