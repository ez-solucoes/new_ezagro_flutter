
import 'package:flutter/cupertino.dart';
import 'package:new_ezagro_flutter/consts/app_colors.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_outlined_button.dart';

import '../../../../consts/app_strings.dart';

class HomePage extends StatelessWidget {

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
              CustomElevatedButton(onPressed: (){}, label: AppStrings.pluralServicesOrder),
              CustomOutlinedButton(onPressed: (){}, label: AppStrings.createServiceOrder, textStyle: AppTextStyles.boldMediumTextStyle(color: AppColors.blackColor))
            ],
          ),
        ));
  }

}