import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ezagro_flutter/consts/app_drawables.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/authentication_controller/authentication_controller.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/buttons/custom_underlined_text_button.dart';
import '../../../widgets/textFields/custom_outlined_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appLoginPage;

  static navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  final TextEditingController _controller = TextEditingController();

  LoginPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthenticationController>();
    return BackgroundWidget(
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 40),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset(AppDrawables.ezAgroLogoComplete),
          const SizedBox(height: 72),
          CustomOutlinedTextFormField(
              controller: _controller, label: AppStrings.cpfString),
          const SizedBox(height: 27),
          CustomOutlinedTextFormField(
              controller: _controller, label: AppStrings.passwordString),
          const SizedBox(height: 37),
          Observer(
            builder: (context) => CustomElevatedButton(
              onPressed: () {
                controller.authenticate();
              },
              label: AppStrings.enterString,
              isLoading: controller.isLoading,
            ),
          ),
          const SizedBox(height: 37),
          CustomUnderlinedTextButton(
              onTap: () {}, label: AppStrings.forgotPasswordString),
          const SizedBox(height: 184),
          Center(
              child: CustomUnderlinedTextButton(
                  onTap: () {}, label: AppStrings.firstAccessString)),
        ]),
      ),
    );
  }
}
