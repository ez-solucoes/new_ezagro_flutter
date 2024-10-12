import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/authentication_controller/authentication_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_forms/password_form_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../consts/app_strings.dart';

class UsernameInputPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appUsernameInputPage;

  static navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const UsernameInputPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthenticationController>();
    final TextEditingController textController = TextEditingController();

    return BackgroundWidget(
      appBar: const CustomAppBarWidget(
        appBarType: AppBarType.stepsAndBackArrow,
        indicatorValue: 0.8,
      ),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: PasswordFormWidget(
            isLoading: controller.isLoading,
            title: AppStrings.firstTypeYourCpfString,
            controller: textController,
            buttonText: AppStrings.forwardString,
            passwordField: false,
            onButtonPressed: () {}),
      ),
    );
  }
}
