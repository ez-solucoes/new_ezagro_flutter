import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_green_elevated_button.dart';
import '../../../consts/app_colors.dart';
import '../widgets/textFields/custom_pinput_text_field.dart';

class RegisterSecondStepPage extends StatelessWidget {
  const RegisterSecondStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: const CustomAppBarWidget(indicatorValue: 0.8, appBarType: AppBarType.stepsAndBackArrow,),
      scrollable: true,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 72),
            const Text(
              AppStrings.weSentTheConfirmationCodeToYourPhone,
              style:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.blackColor),
            ),
            const SizedBox(height: 18),
            Text(
              AppStrings.typeTheNumberBellow,
              textAlign: TextAlign.start,
              style: AppTextStyles.subTitleTextStyle(color: AppColors.blackColor),
            ),
            const SizedBox(height: 18),
            Center(
              child: CustomPinputTextField(
                onComplete: (pin) {},
              ),
            ),
            const SizedBox(height: 51),
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
