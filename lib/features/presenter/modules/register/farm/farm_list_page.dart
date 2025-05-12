import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_striped_table/custom_striped_table_widget.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/custom_search_bar/custom_search_bar.dart';
import 'controller/farm_controller.dart';
import 'farm_page.dart';

class FarmListPage extends StatelessWidget {
  static const String routePath = AppRoutes.appFarmListPage;

  static navigate() => Modular.to.navigate(routePath);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const FarmListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<FarmController>();
    controller.getFarmsList();
    return BackgroundWidget(
        scrollable: false,
        child: Scaffold(
            backgroundColor: AppColors.transparent,
            resizeToAvoidBottomInset: false,
            appBar: const CustomAppBarWidget(
              appBarType: AppBarType.hamburgerAndTitle,
              title: AppStringsPortuguese.pluralFarmTitle,
            ),
            drawer: CustomDrawerWidget(),
            body: Observer(
              builder: (context) =>  Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  controller.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 0),
                              child: CustomSearchBar(
                                onTextChanged: (search) {
                                  controller.searchFarm(search);
                                },
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(20),
                                child: CustomStripedTable(
                                      columnNames: [
                                        AppStringsPortuguese.hashtagSymbol,
                                        AppStringsPortuguese.farmColumnName,
                                        AppStringsPortuguese.farmCostCenterColumn
                                      ],
                                      data: FarmModel.convertToTableList(
                                          controller.filteredFarms),
                                      maxHeight: 0.7 * MediaQuery.of(context).size.height,
                                      onTap: (index) {
                                        FarmPage.navigate(ArgParams(firstArgs: controller.filteredFarms[index].id.toString()));
                                      }),
                                )
                          ],
                        ),
                ],
              ),
            )));
  }
}
