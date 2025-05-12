import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/farm/farm_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_striped_table/custom_striped_table_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/documents_list_widget/documents_list_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../data/models/plot_models/plot_model.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import 'controller/farm_controller.dart';

class FarmPage extends StatelessWidget {
  final ArgParams args;
  static const String routePath = AppRoutes.appFarmPage;

  static void navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const FarmPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<FarmController>();
    controller.getFarmById(args);
    return BackgroundWidget(
        scrollable: true,
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStringsPortuguese.singularFarmTitle,
          callback: () {
            FarmListPage.navigate();
          },
        ),
        child: Observer(
          builder: (context) => controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MultInfoCard(
                        title: AppStringsPortuguese.singularFarmTitle,
                        sectionsData: [
                          (
                            [
                              (
                                AppStringsPortuguese.farmNameLabel,
                                controller.farm?.name ?? ""
                              ),
                              (
                                AppStringsPortuguese.farmOwnerLabel,
                                controller.farm?.ownerName ?? ""
                              ),
                              (
                                AppStringsPortuguese.farmCostCenterLabel,
                                controller.farm?.localCostCenter?.name ?? ""
                              ),
                              (
                                AppStringsPortuguese.farmExternalCodeLabel,
                                "Código Extermo"
                              ),
                              (
                                AppStringsPortuguese.farmCaepfLabel,
                                controller.farm?.caepf ?? ""
                              ),
                              (
                                AppStringsPortuguese.farmAreaLabel,
                                controller.farm?.area ?? ""
                              ),
                            ],
                            [
                              (
                                AppStringsPortuguese.farmStateSubscriptionLabel,
                                controller.farm?.stateRegistration ?? ""
                              ),
                              (
                                AppStringsPortuguese.farmOwnerRegisterLabel,
                                "Registro do Proprietário"
                              ),
                              (
                                AppStringsPortuguese.farmCompanyLabel,
                                controller.farm?.company?.name ?? ""
                              ),
                              (
                                AppStringsPortuguese.farmCarLabel,
                                controller.farm?.car ?? ""
                              ),
                              (
                                AppStringsPortuguese.farmCnaeLabel,
                                controller.farm?.cnae ?? ""
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultInfoCard(
                        title: AppStringsPortuguese.addressLabel,
                        sectionsData: [
                          (
                            [
                              (
                                AppStringsPortuguese.addressCepLabel,
                                controller.farm?.addressZipCode ?? ""
                              ),
                              (
                                AppStringsPortuguese.addressStreetLabel,
                              controller.farm?.addressStreet ?? ""
                              ),
                              (
                                AppStringsPortuguese.addressStateLabel,
                                controller.farm?.addressState ?? ""
                              ),
                              (
                                AppStringsPortuguese.addressReferenceLabel,
                                controller.farm?.addressReference ?? ""
                              ),
                            ],
                            [
                              (
                                AppStringsPortuguese.addressCityLabel,
                                controller.farm?.addressCity ?? ""
                              ),
                              (
                                AppStringsPortuguese.addressNeighborhoodLabel,
                                controller.farm?.addressNeighborhood ?? ""
                              ),
                              (
                                AppStringsPortuguese.addressCountryLabel,
                                controller.farm?.addressCountry ?? ""
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomStripedTable(
                          columnNames: [
                            AppStringsPortuguese.farmPlotColumn,
                            AppStringsPortuguese.farmAreaColumn,
                            AppStringsPortuguese.farmCropColumn
                          ],
                          data: PlotModel.convertToTableList(controller.farm?.plots ?? []),
                          maxHeight: MediaQuery.of(context).size.height * 0.75,
                          equalColumnProportions: true,
                          onTap: (id) {}),
                      const SizedBox(
                        height: 10,
                      ),
                      DocumentsListWidget(
                          title: AppStringsPortuguese.contractsTableTitle,
                          data: [],
                          maxHeight: MediaQuery.of(context).size.height * 0.2,
                          action: () {}),
                      const SizedBox(
                        height: 10,
                      ),
                      DocumentsListWidget(
                          title: AppStringsPortuguese.attachmentsTableTitle,
                          data: [],
                          maxHeight: MediaQuery.of(context).size.height * 0.2,
                          action: () {}),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
        ));
  }
}
