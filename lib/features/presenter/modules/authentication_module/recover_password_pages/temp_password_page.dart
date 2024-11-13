import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/authentication_controller/authentication_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/new_password_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/username_input_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_forms/password_form_widget.dart';

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
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.backArrow,
          callback: () => UsernameInputPage.navigate,
        ),
        scrollable: true,
        child: Padding(
          padding: const EdgeInsets.all(19),
          child: PasswordFormWidget(
            isLoading: controller.isLoading,
            title: AppStringsPortuguese.tempPassword,
            controller: textController,
            buttonText: AppStringsPortuguese.forwardString,
            onButtonPressed: () {
              controller.temporaryPassword = textController.text;
              NewPasswordPage.navigate();
            },
            passwordField: true,
          ),
        ));
  }
}
