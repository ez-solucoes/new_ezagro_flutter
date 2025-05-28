import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../consts/app_routes.dart';
import '../../../../design_system/drawables/app_drawables.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';
import '../../widgets/appbar/custom_appbar_widget.dart';
import '../../widgets/background/background_widget.dart';
import '../../widgets/buttons/custom_navigation_button.dart';
import '../home/home_page.dart';
import 'company/company_list_page.dart';
import 'contracts/contract_list_page.dart';
import 'employees/employees_list_page.dart';
import 'farm/farm_list_page.dart';
import 'machinery/machinery_list_page.dart';

class RegistersPage extends StatelessWidget {
  static const String routePath = AppRoutes.appRegistersPage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);
  static pop() => Modular.to.pop(routePath);

  const RegistersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        appBar: CustomAppBarWidget(
          indicatorValue: 0.8,
          title: AppStringsPortuguese.appCapitalTile,
          appBarType: AppBarType.backArrow,
          callback: () => HomePage.push(),
        ),
        scrollable: true,
        needsDrawer: false,
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              CustomNavigationButton(
                  title: AppStringsPortuguese.pluralFarmTitle,
                  icon: SvgPicture.asset(AppDrawables.farmIcon),
                  onPressed: () {
                    FarmListPage.navigate();
                  }),
              const SizedBox(height: 40),
              CustomNavigationButton(
                  title: AppStringsPortuguese.pluralEmployeeTitle,
                  icon: Icons.people_outline_rounded,
                  onPressed: () {
                    EmployeesListPage.navigate();
                  }),
              const SizedBox(height: 40),
              CustomNavigationButton(
                  title: AppStringsPortuguese.machineryPluralTitle,
                  icon: Icons.agriculture_outlined,
                  onPressed: () {
                    MachineryListPage.navigate();
                  }),
              const SizedBox(height: 40),
              CustomNavigationButton(
                  title: AppStringsPortuguese.pluralCompanyTitle,
                  icon: SvgPicture.asset(AppDrawables.companyIcon),
                  onPressed: () {
                    CompanyListPage.navigate();
                  }),
              const SizedBox(height: 40),
              CustomNavigationButton(
                  title: AppStringsPortuguese.pluralContractTitle,
                  icon: Icons.description_outlined,
                  onPressed: () {
                    ContractListPage.navigate();
                  }),
              const SizedBox(height: 40),
            ],
          ),
        ));
  }
}
