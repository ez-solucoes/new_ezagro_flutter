import 'package:flutter/material.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/text_fields/custom_underlined_text_field.dart';

class ChangePasswordStepPage extends StatelessWidget {
  const ChangePasswordStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      scrollable: true,
      appBar:
          const CustomAppBarWidget(appBarType: AppBarType.titleAndBackArrow),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 52),
            Text(
              '',
              style: AppTextStyles.titleTextStyle(color: AppColors.blackColor),
            ),
            const SizedBox(height: 45),
            CustomUnderlinedTextField(
              passwordField: false,
              hintText: '000.000.000-00',
              onPressed: () {},
              controller: TextEditingController(),
            ),
            const SizedBox(height: 40),
            Center(
              child: CustomElevatedButton(
                onPressed: () {},
                label: AppStringsPortuguese.forwardString,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
