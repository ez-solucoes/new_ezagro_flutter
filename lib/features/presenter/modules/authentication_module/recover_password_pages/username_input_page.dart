import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/authentication_controller/authentication_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages//temp_password_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_forms/password_form_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../core/utils/text_input_formatter_mask.dart';

class UsernameInputPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appUsernameInputPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push() =>
      Modular.to.pushNamed(routePath);

  const UsernameInputPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthenticationController>();
    final TextEditingController textController = TextEditingController();

    return BackgroundWidget(
      appBar: const CustomAppBarWidget(
        appBarType: AppBarType.stepsAndBackArrow,
        indicatorValue: 0.25,
      ),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: PasswordFormWidget(
            isLoading: controller.isLoading,
            inputType: TextInputType.number,
            inputFormatters: [TextInputFormatterMask(mask: 'CPF')],
            title: AppStrings.forgotPasswordCpf,
            controller: textController,
            buttonText: AppStrings.forwardString,
            passwordField: false,
            onButtonPressed: () {
              controller.username = textController.text;
              TempPasswordPage.push();

            }),
      ),
    );
  }
}
