import 'package:flutter/material.dart';

import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/text_fields/custom_underlined_text_field.dart';

class RegisterThirdStepPage extends StatelessWidget {
  const RegisterThirdStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: const CustomAppBarWidget(
        indicatorValue: 0.8,
        appBarType: AppBarType.stepsAndBackArrow,
      ),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 72),
            Text(
              AppStrings.nowTypeNewPassword,
              style: AppTextStyles.titleTextStyle(color: AppColors.blackColor),
            ),
            const SizedBox(height: 67),
            CustomUnderlinedTextField(
              onPressed: () {},
              controller: TextEditingController(),
              passwordField: true,
            ),
            const SizedBox(height: 40),
            Center(
              child: CustomElevatedButton(
                onPressed: () {},
                label: AppStrings.forwardString,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
