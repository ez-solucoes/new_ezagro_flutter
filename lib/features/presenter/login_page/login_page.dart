import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ezagro_flutter/consts/app_drawables.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

import '../widgets/buttons/custom_green_elevated_button.dart';
import '../widgets/buttons/custom_underlined_text_button.dart';
import '../widgets/textFields/custom_outlined_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 40),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset(AppDrawables.ezAgroLogoComplete),
          const SizedBox(height: 72),
          CustomOutlinedTextFormField(controller: _controller, label: AppStrings.cpfString),
          const SizedBox(height: 27),
          CustomOutlinedTextFormField(controller: _controller, label: AppStrings.passwordString),
          const SizedBox(height: 37),
          CustomGreenElevatedButton(
            onPressed: () {},
            label: AppStrings.enterString,
          ),
          const SizedBox(height: 37),
          CustomUnderlinedTextButton(onTap: () {}, label: AppStrings.forgotPasswordString),
          const SizedBox(height: 184),
          Center(
              child:
                  CustomUnderlinedTextButton(onTap: () {}, label: AppStrings.firstAccessString)),
        ]),
      ),
    );
  }
}
