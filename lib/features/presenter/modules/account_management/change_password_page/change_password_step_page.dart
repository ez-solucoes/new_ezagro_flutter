import 'package:flutter/material.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../consts/app_text_styles.dart';
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
      appBar: const CustomAppBarWidget(appBarType: AppBarType.titleAndBackArrow),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 52),
            Text(
              AppStrings.forgotPasswordFirstStep,
              style: AppTextStyles.titleTextStyle(color: AppColors.blackColor),
            ),
            const SizedBox(height: 45),
            CustomUnderlinedTextField(
              hintText: '000.000.000-00',
              onPressed: () {},
              controller: TextEditingController(),
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
