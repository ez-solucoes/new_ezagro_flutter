import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_list_page/service_order_list_page.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../modules/home/home_page.dart';
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
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {return CustomDrawerHeaderWidget();
                } else if (index == 1) {
                  return GestureDetector(
                    onTap: () {
                      HomePage.navigate();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Home",
                        style: AppTextStyles.boldMediumTextStyle(color: AppColors.backgroundColor),
                      ),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      ServiceOrderListPage.navigate();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        AppStringsPortuguese.pluralServicesOrder,
                        style: AppTextStyles.boldMediumTextStyle(color: AppColors.backgroundColor),
                      ),
                    ),
                  );
                }
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
