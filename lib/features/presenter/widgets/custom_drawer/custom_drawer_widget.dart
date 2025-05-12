import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/company/company_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/contracts/contract_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/employees/employees_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/farm/farm_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/machinery/machinery_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_list_page/service_order_list_page.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../modules/home/home_page.dart';
import '../custom_drawer_header/custom_drawer_header_widget.dart';
import '../logout_dialog/logout_dialog.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<(VoidCallback onTap, String text)> menuItems = [
      (HomePage.navigate, "Home"),
      (FarmListPage.navigate, AppStringsPortuguese.pluralFarmTitle),
      (ContractListPage.navigate, AppStringsPortuguese.pluralContractTitle),
      (EmployeesListPage.navigate, AppStringsPortuguese.pluralEmployeeTitle),
      (MachineryListPage.navigate, AppStringsPortuguese.machineryAndImplementsTitle),
      (CompanyListPage.navigate, AppStringsPortuguese.pluralCompanyTitle),
      (ServiceOrderListPage.navigate, AppStringsPortuguese.pluralServicesOrder)
    ];

    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        color: AppColors.primaryBlackColor,
        child: Column(
          children: [
            const SizedBox(height: 25),
            Expanded(
              child: ListView.separated(
                itemCount: menuItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const CustomDrawerHeaderWidget();
                  } else {
                    final menuItem = menuItems[index - 1]; //
                    return GestureDetector(
                      onTap: menuItem.$1,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          menuItem.$2,
                          style: AppTextStyles.boldMediumTextStyle(
                              color: AppColors.backgroundColor),
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
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                showDialog(context: context, builder: (BuildContext context) {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height*0.35,
                        horizontal: 20
                      ),
                      child: LogoutDialog());
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.primaryRedColor),
                child: Row(
                  children: [
                    Icon(Icons.logout_outlined, color: AppColors.primaryWhiteColor,),
                    Text("Sair",
                      textAlign: TextAlign.start,
                      style:AppTextStyles.boldMediumTextStyle(
                          color: AppColors.backgroundColor),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}