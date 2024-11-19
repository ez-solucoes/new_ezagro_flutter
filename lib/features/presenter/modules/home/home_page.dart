import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ezagro_flutter/design_system/drawables/app_drawables.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/company/company_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/contracts/contract_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/employees/employees_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/farm/farm_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/machinery/machinery_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_navigation)button.dart';
import '../../../../consts/app_routes.dart';
import '../../../domain/params/arg_params/arg_params.dart';

class HomePage extends StatelessWidget {

  final ArgParams? args;
  static const String routePath = AppRoutes.appHomePage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);

  const HomePage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        appBar: CustomAppBarWidget(
          indicatorValue: 0.8,
          title: AppStringsPortuguese.appCapitalTile,
          appBarType: AppBarType.hamburgerAndTitle,
        ),
        scrollable: true,
        needsDrawer: true,
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              CustomNavigationButton(title: AppStringsPortuguese.pluralFarmTitle, icon: SvgPicture.asset(AppDrawables.farmIcon) ,onPressed: (){FarmListPage.navigate();}),
              const SizedBox(height: 40,),
              CustomNavigationButton(title: AppStringsPortuguese.pluralEmployeeTitle, icon: Icons.people_outline_rounded,onPressed: (){EmployeesListPage.navigate();}),
              const SizedBox(height: 40,),
              CustomNavigationButton(title: AppStringsPortuguese.machineryPluralTitle, icon: Icons.agriculture_outlined ,onPressed: (){MachineryListPage.navigate();}),
              const SizedBox(height: 40,),
              CustomNavigationButton(title: AppStringsPortuguese.pluralCompanyTitle, icon: SvgPicture.asset(AppDrawables.companyIcon) ,onPressed: (){CompanyListPage.navigate();}),
              const SizedBox(height: 40,),
              CustomNavigationButton(title: AppStringsPortuguese.pluralContractTitle, icon: Icons.description_outlined ,onPressed: (){ContractListPage.navigate();}),
              const SizedBox(height: 40,),
            ],
          ),
        ));
  }

}