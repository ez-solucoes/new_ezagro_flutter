import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_create/service_order_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/custom_autocomplete/custom_autocomplete_card_widget.dart';
import '../../../widgets/custom_autocomplete/custom_autocomplete_widget.dart';

class ServiceOrderCreateGeneralInfoFirstPage extends StatelessWidget {
  static const String routePath = AppRoutes.appServiceOrderCreateGeneralInfoFirstPage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);

  static pop() => Modular.to.pop();

  const ServiceOrderCreateGeneralInfoFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderCreateController>();
    controller.getAllAgriculturalActivityTypesToSelect();

    return BackgroundWidget(
      scrollable: true,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.backArrow,
        title: AppStringsPortuguese.createServiceOrder,
        callback: () => ServiceOrderCreateGeneralInfoFirstPage.pop(),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Observer(
          builder: (context) {
            if (controller.isFirstLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  Observer(
                    builder: (context) => CustomAutocompleteCardWidget(
                      title: 'Tipo de Atividade Agrícola:',
                      itemList: controller.agriculturalActivityTypeListToSelect,
                      onItemSelected: (SelectEntity item) {
                        controller.agriculturalActivityType = item;
                        debugPrint('id: ${controller.agriculturalActivityType}');
                        debugPrint('Selecionado: ${item.label}');
                        controller.getAllAgriculturalActivityByTypeIdToSelect();
                      },
                      autoCompleteType: AutoCompleteType.simple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Observer(
                    builder: (context) {
                      return controller.isAgriculturalActivityLoading
                          ? Center(child: CircularProgressIndicator())
                          : CustomAutocompleteCardWidget(
                              title: 'Atividade Agrícola:',
                              itemList: controller.agriculturalActivityListToSelect,
                              onItemSelected: (SelectEntity item) {
                                controller.agriculturalActivity = item;
                                debugPrint(
                                    'id: ${controller.agriculturalActivity?.value}');
                                debugPrint('Selecionado: ${item.label}');
                                controller
                                    .getAllAgriculturalSubActivitiesByActivityIdToSelect();
                                if (controller
                                    .agriculturalSubActivityListToSelect.isEmpty) {
                                  controller.getAllCostCenterToSelect();
                                }
                              },
                              autoCompleteType: AutoCompleteType.simple,
                            );
                    },
                  ),
                  SizedBox(height: 10),
                  Observer(builder: (context) {
                    return controller.agriculturalSubActivityListToSelect.isNotEmpty
                        ? controller.isAgriculturalSubActivityLoading
                            ? Center(child: CircularProgressIndicator())
                            : CustomAutocompleteCardWidget(
                                title: 'Subatividade Agrícola:',
                                itemList: controller.agriculturalSubActivityListToSelect,
                                onItemSelected: (SelectEntity item) {
                                  controller.agriculturalSubActivity = item;
                                  debugPrint(
                                      'id: ${controller.agriculturalSubActivity!.value}');
                                  debugPrint('Selecionado: ${item.label}');
                                  controller.getAllCostCenterToSelect();
                                },
                                autoCompleteType: AutoCompleteType.simple,
                              )
                        : Container();
                  }),
                  SizedBox(height: 10),
                  Observer(
                    builder: (context) {
                      return controller.isCostCenterLoading
                          ? Center(child: CircularProgressIndicator())
                          : CustomAutocompleteCardWidget(
                              title: 'Centro de Custo:',
                              itemList: controller.costCenterListToSelect,
                              onItemSelected: (SelectEntity item) {
                                controller.updateCostCenterAndReload(item);
                                controller.costCenter = item;
                                debugPrint('id: ${controller.costCenter?.value}');
                                debugPrint('Selecionado: ${item.label}');
                              },
                              autoCompleteType: AutoCompleteType.simple,
                            );
                    },
                  ),
                  SizedBox(height: 10),
                  Observer(
                    builder: (context) {
                      return controller.isFarmLoading
                          ? Center(child: CircularProgressIndicator())
                          : CustomAutocompleteCardWidget(
                              title: 'Fazenda:',
                              itemList: controller.farmsByCostCenterIdListToSelect,
                              onItemSelected: (SelectEntity item) {
                                controller.farm = item;
                                debugPrint('id: ${controller.farm?.value}');
                                debugPrint('Selecionado: ${item.label}');
                              },
                              autoCompleteType: AutoCompleteType.simple,
                            );
                    },
                  ),
                  SizedBox(height: 90),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Observer(builder: (context) {
                        return Checkbox(
                          value: controller.isNewPlanting,
                          activeColor: AppColors.primaryBlackColor,
                          onChanged: (value) {
                            controller.isNewPlanting = value!;
                          },
                        );
                      }),
                      Text(
                        'Novo Plantio',
                        style: AppTextStyles.boldMediumTextStyle(
                            color: AppColors.primaryBlackColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                          onPressed: () {},
                          label: 'Próximo',
                          backgroundColor: AppColors.primaryGreenColor,
                          borderColor: Colors.transparent,
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
