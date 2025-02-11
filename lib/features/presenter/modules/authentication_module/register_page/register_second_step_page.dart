import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/register_page/register_fifth_step_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/register_page/register_first_step_page.dart';

import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/custom_forms/password_form_widget.dart';
import '../authentication_controller/authentication_controller.dart';

class RegisterSecondStepPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appRegisterSecondStepPage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);

  const RegisterSecondStepPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthenticationController>();
    final TextEditingController textController = TextEditingController();

    return BackgroundWidget(
      appBar: const CustomAppBarWidget(
        indicatorValue: 0.66,
        appBarType: AppBarType.stepsAndBackArrow,
      ),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: PasswordFormWidget(
          isLoading: controller.isLoading,
          title: AppStringsPortuguese.repeatYourNewPasswordString,
          controller: textController,
          buttonText: AppStringsPortuguese.forwardString,
          onButtonPressed: () {
            controller.retypePassword = textController.text;
            if (controller.comparePasswords(controller.password, controller.retypePassword) &&
                ((controller.password != '' && controller.retypePassword != ''))) {
              try {
                controller.updatePassword(context);
                if (context.mounted) {
                  RegisterFifthStepPage.navigate();
                }
              } catch (e) {
                if (context.mounted) {
                  CustomSnackBarWidget.show(
                      SnackBarType.error, context, 'Erro ao atualizar senha!');
                }
              }
            } else {
              CustomSnackBarWidget.show(SnackBarType.error, context, 'As senhas são diferentes ou inválidas!');
              textController.clear();
              controller.password = '';
              controller.retypePassword = '';
              RegisterFirstStepPage.navigate();
            }
          },
          passwordField: true,
        ),
      ),
    );
  }
}
