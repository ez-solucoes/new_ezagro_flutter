import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';
import '../custom_drawer_header/custom_drawer_header_widget.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        color: AppColors.primaryBlackColor, //
        child: Column(
          children: [
            const SizedBox(height: 25),
            Expanded(
                child: ListView.separated(
              itemCount: 2,
              itemBuilder: (context, index) {
                return index == 0
                    ? CustomDrawerHeaderWidget()
                    : Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          AppStringsPortuguese.pluralServicesOrder,
                          style: AppTextStyles.boldMediumTextStyle(
                              color: AppColors.backgroundColor),
                        ));
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 0.2,
                  indent: 0,
                  endIndent: 0,
                  color: AppColors.borderWhiteColor,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
