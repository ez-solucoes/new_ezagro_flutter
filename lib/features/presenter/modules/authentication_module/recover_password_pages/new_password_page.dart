import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/repeat_password_page.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/custom_forms/password_form_widget.dart';
import '../authentication_controller/authentication_controller.dart';

class NewPasswordPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appNewPasswordPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push() =>
      Modular.to.pushNamed(routePath);

  const NewPasswordPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthenticationController>();
    final TextEditingController textController = TextEditingController();

    return BackgroundWidget(
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.stepsAndBackArrow,
          indicatorValue: 0.75,
        ),
        scrollable: true,
        child: Padding(
          padding: const EdgeInsets.all(19),
          child: PasswordFormWidget(
            isLoading: controller.isLoading,
            title: AppStrings.createNewPasswordString,
            controller: textController,
            buttonText: AppStrings.forwardString,
            onButtonPressed: (){
              controller.password = textController.text;
              RepeatPasswordPage.push();
            },
            passwordField: true,
          ),
        )
    );
  }
}
