import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/drawables/app_drawables.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings.dart';

import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/buttons/custom_underlined_text_button.dart';
import '../../../widgets/text_fields/custom_outlined_text_form_field.dart';

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
    return BackgroundWidget(
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 40),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset(AppDrawables.ezAgroLogoComplete),
          const SizedBox(height: 72),
          CustomOutlinedTextFormField(
            controller: _controller,
            label: AppStringsPortuguese.cpfString,
            passwordField: false,
          ),
          const SizedBox(height: 27),
          CustomOutlinedTextFormField(
            controller: _controller,
            label: AppStringsPortuguese.passwordString,
            passwordField: true,
          ),
          const SizedBox(height: 37),
          CustomElevatedButton(
            onPressed: () {},
            label: AppStringsPortuguese.enterString,
          ),
          const SizedBox(height: 37),
          CustomUnderlinedTextButton(
              onTap: () {}, label: AppStringsPortuguese.forgotPasswordString),
          const SizedBox(height: 184),
          Center(
              child: CustomUnderlinedTextButton(
                  onTap: () {}, label: AppStringsPortuguese.firstAccessString)),
        ]),
      ),
    );
  }
}
