import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/strings/app_strings.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../widgets/appbar/custom_appbar_widget.dart';
import '../../widgets/background/background_widget.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/buttons/custom_outlined_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        appBar: CustomAppBarWidget(
          indicatorValue: 0.8,
          title: "EZ AGRO",
          appBarType: AppBarType.hamburgerAndTitle,
        ),
        scrollable: true,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomElevatedButton(
                  onPressed: () {}, label: AppStringsPortuguese.pluralServicesOrder),
              CustomOutlinedButton(
                  onPressed: () {},
                  label: AppStringsPortuguese.createServiceOrder,
                  textStyle: AppTextStyles.boldMediumTextStyle(
                      color: AppColors.blackColor))
            ],
          ),
        ));
  }
}
