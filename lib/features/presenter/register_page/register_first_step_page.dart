import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_colors.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

import '../../../consts/app_text_styles.dart';
import '../widgets/buttons/custom_green_elevated_button.dart';
import '../widgets/textFields/custom_underlined_text_field.dart';

class RegisterFirstStepPage extends StatelessWidget {
  const RegisterFirstStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: const CustomAppBarWidget(indicatorValue: 0.8, appBarType: AppBarType.stepsAndBackArrow,),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 72),
            Text(
              AppStrings.firstTypeYourCpfString,
              style: AppTextStyles.titleTextStyle(color: AppColors.blackColor),
            ),
            const SizedBox(height: 67),
            CustomUnderlinedTextField(
              onPressed: () {},
              controller: TextEditingController(),
            ),
            const SizedBox(height: 40),
            Center(
              child: CustomGreenElevatedButton(
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
