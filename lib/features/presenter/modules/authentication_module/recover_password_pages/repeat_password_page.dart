import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/new_password_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/recover_password_success_page.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/custom_forms/password_form_widget.dart';
import '../authentication_controller/authentication_controller.dart';

class RepeatPasswordPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appRepeatPasswordPage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);

  const RepeatPasswordPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthenticationController>();
    final TextEditingController textController = TextEditingController();

    return BackgroundWidget(
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.backArrow,
          callback: NewPasswordPage.navigate,
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
              if (controller.comparePasswords(controller.password, controller.retypePassword)) {
                controller.updatePassword(context).whenComplete((){
                  RecoverPasswordSuccessPage.navigate();
                }).onError((e, stacktrace){
                  CustomSnackBarWidget.show(SnackBarType.error, context, 'As senhas são diferentes!');
                });

              } else {
                CustomSnackBarWidget.show(SnackBarType.error, context, 'As senhas são diferentes!');
                textController.clear();
                controller.password = '';
                controller.retypePassword = '';
                NewPasswordPage.navigate();
              }
            },
            passwordField: true,
          ),
        ));
  }
}
