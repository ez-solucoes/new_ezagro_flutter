import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/machinery/machinery_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/documents_list_widget/documents_list_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import 'machinery_controller.dart';

class MachineryImplementsPage extends StatelessWidget {
  final ArgParams args;
  static const String routePath = AppRoutes.appMachineryPage;

  static navigate() => Modular.to.navigate(routePath);

  static push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  const MachineryImplementsPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<MachineryController>();

    controller.getMachineryImplementById(args.firstArgs);

    return BackgroundWidget(
        scrollable: true,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStringsPortuguese.machineryScreenTitle,
          callback: MachineryListPage.navigate,
        ),
        child: Observer(
          builder: (context) => Padding(
              padding: EdgeInsets.all(12),
              child: (controller.isLoading)
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MultInfoCard(
                            title: AppStringsPortuguese.machineryBasicInformation,
                            sectionsData: [
                              (
                                [
                                  (
                                    AppStringsPortuguese.machineryTypeLabel,
                                    controller.machineryImplementEntity.type!.name
                                  ),
                                  (
                                    AppStringsPortuguese.machineryAliasLabel,
                                    controller.machineryImplementEntity.nickname!
                                  )
                                ],
                                []
                              ),
                              (
                                [
                                  (AppStringsPortuguese.machineryModelLabel,
                                  controller.machineryImplementEntity.modelName!
                                  ),
                                  (
                                    AppStringsPortuguese.machineryCostCenterLabel,
                                    controller.machineryImplementEntity.costCenter!.name!
                                  ),
                                  (AppStringsPortuguese.machineryDepartmentLabel,
                                  controller.machineryImplementEntity.department!.name!
                                  )
                                ],
                                [
                                  (AppStringsPortuguese.machineryBrandLabel,
                                  controller.machineryImplementEntity.brandName!
                                  ),
                                  (AppStringsPortuguese.machineryYearLabel,
                                  controller.machineryImplementEntity.fabricationYear.toString()
                                  ),
                                  (
                                    AppStringsPortuguese.machinerySubdepartmentLabel,
                                  controller.machineryImplementEntity.subDepartment!.name!
                                  )
                                ]
                              ),
                              (
                                [
                                  (AppStringsPortuguese.machineryAssetNumberLabel,
                                  controller.machineryImplementEntity.assetNumber.toString()
                                  ),
                                  (AppStringsPortuguese.machineryTelemetryNumberLabel, "123456789")
                                ],
                                []
                              )
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        MultInfoCard(
                            title: AppStringsPortuguese.machinerySpecificInformation,
                            sectionsData: [
                              (
                                [
                                  (AppStringsPortuguese.machineryChassisLabel,
                                  controller.machineryImplementEntity.chassisNumber!
                                  ),
                                  (AppStringsPortuguese.machineryWorkingHours,
                                  controller.machineryImplementEntity.workHours!
                                  )
                                ],
                                []
                              ),
                              (
                                [(AppStringsPortuguese.machineryKilometersLabel,
                                controller.machineryImplementEntity.mileage.toString()
                                )],
                                [(AppStringsPortuguese.machineryTankCapacityLabel,
                                controller.machineryImplementEntity.tankCapacity.toString()
                                )]
                              ),
                              (
                                [
                                  (AppStringsPortuguese.machineryDocumentLabel,
                                  controller.machineryImplementEntity.insuranceContracts!.first.contract.toString()
                                  ),
                                  (AppStringsPortuguese.machineryInvoiceLabel,
                                  controller.machineryImplementEntity.invoiceNumber.toString()
                                  ),
                                  (
                                    AppStringsPortuguese.machineryInsuranceExpiringDateLabel,
                                  controller.machineryImplementEntity.insuranceContracts!.first.endDate.toString()
                                  ),
                                  (AppStringsPortuguese.machineryInsurancePolicyLabel,
                                  controller.machineryImplementEntity.insuranceContracts!.first.externalCode.toString()
                                  )
                                ],
                                []
                              )
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        MultInfoCard(
                            title: AppStringsPortuguese.machineryAcquisition,
                            sectionsData: [
                              (
                                [
                                  (
                                    AppStringsPortuguese.machineryAcquisitionDateLabel,
                                  controller.machineryImplementEntity.acquisitionDate.toString()
                                  ),
                                  (
                                    AppStringsPortuguese.machineryAcquisitionValueLabel,
                                    "R\$${controller.machineryImplementEntity.acquisitionValue},00"
                                  )
                                ],
                                []
                              )
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        DocumentsListWidget(
                            title: AppStringsPortuguese.machineryMaintenance,
                            data: ["Nota Fiscal", "Nota Fiscal"],
                            maxHeight: MediaQuery.of(context).size.height * 0.2,
                            action: () {}),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    )),
        ));
  }
}
