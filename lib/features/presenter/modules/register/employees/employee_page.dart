import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/employees/tabs/employee_additional_information_tab.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/employees/tabs/employee_general_information_tab.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';

class EmployeePage extends StatelessWidget {

  static const String routePath = AppRoutes.appEmployeePage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Modular.get<EmployeeController>();
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: BackgroundWidget(
          scrollable: false,
          appBar: const CustomAppBarWidget(
            appBarType: AppBarType.hamburgerAndTitle,
            title: AppStringsPortuguese.singularEmployeeTitle,
            bottom: null
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: [
              TabBar(tabs: <Widget>[
                Tab(text: AppStringsPortuguese.generalInformationTab),
                Tab(text: AppStringsPortuguese.additionalInformationTab,)
              ]),
              const SizedBox(height: 10,),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: TabBarView(
                    children: <Widget>[
                      EmployeeGeneralInformationTab(),
                      EmployeeAdditionalInformationTab()
                    ]),
              )
            ],),
          )),
    );
  }

}
