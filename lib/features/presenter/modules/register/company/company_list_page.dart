import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/data/models/company_models/company_model.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/company/company_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_striped_table/custom_striped_table_widget.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/custom_search_bar/custom_search_bar.dart';
import 'controller/company_controller.dart';

class CompanyListPage extends StatelessWidget {

  static const String routePath = AppRoutes.appCompanyListPage;

  static void navigate() =>
      Modular.to.navigate(routePath);

  static Future<Object?> push() =>
      Modular.to.pushNamed(routePath);

  static void pop() => Modular.to.pop();
  const CompanyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CompanyController>();
    controller.getCompaniesList();
    return BackgroundWidget(
        scrollable: false,
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBarWidget(
            appBarType: AppBarType.centeredTitleAndBackArrow,
            callback: () => CompanyListPage.pop(),
            title: AppStringsPortuguese.pluralCompanyTitle,
          ),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 0),
                    child: CustomSearchBar(
                      onTextChanged: (search){
                        controller.searchCompany(search);
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20),
                      child: Observer(
                          builder: (context) => CustomStripedTable(
                            columnNames: [AppStringsPortuguese.hashtagSymbol,
                              AppStringsPortuguese.companyNameColumn,
                              AppStringsPortuguese.companyIdentifierColumn
                            ],
                            data: CompanyModel.convertToTableList(controller.filteredCompanies),
                            maxHeight:0.7* MediaQuery.of(context).size.height,
                              onTap: (index){
                                CompanyPage.push(ArgParams(firstArgs: controller.filteredCompanies[index].id.toString()));
                              })))
                ],
              ),
            ],
          )
        ));
  }

}
