import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/employees/employees_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/employees/tabs/employee_additional_information_tab.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/employees/tabs/employee_general_information_tab.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import 'controller/employee_controller.dart';

class EmployeePage extends StatelessWidget {
  final ArgParams args;

  static const String routePath = AppRoutes.appEmployeePage;

  static void navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static Future<Object?> push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const EmployeePage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<EmployeeController>();
    controller.getEmployeeById(args);
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: BackgroundWidget(
          scrollable: false,
          appBar: const CustomAppBarWidget(
              appBarType: AppBarType.centeredTitleAndBackArrow,
              title: AppStringsPortuguese.singularEmployeeTitle,
              callback: EmployeesListPage.pop,),
          child: Observer(
            builder: (context) => controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                    child: Column(
                      children: [
                        TabBar(tabs: <Widget>[
                          Tab(text: AppStringsPortuguese.generalInformationTab),
                          Tab(
                            text: AppStringsPortuguese.additionalInformationTab,
                          )
                        ]),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.75,
                          child: TabBarView(children: <Widget>[
                            EmployeeGeneralInformationTab(),
                            EmployeeAdditionalInformationTab()
                          ]),
                        )
                      ],
                    ),
                  ),
          )),
    );
  }
}
