import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_create/service_order_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/custom_autocomplete/custom_autocomplete_card_widget.dart';
import '../../../widgets/custom_autocomplete/custom_autocomplete_widget.dart';
import '../../../widgets/custom_simple_info_card/custom_simple_info_card_widget.dart';
import '../../../widgets/custom_text_input/custom_text_input_widget.dart';

class ServiceOrderCreateGeneralInfoSecondPage extends StatelessWidget {
  static const String routePath = AppRoutes.appServiceOrderCreateGeneralInfoSecondPage;

  static void navigate() => Modular.to.navigate(routePath);

  static Future<Object?> push() => Modular.to.pushNamed(routePath);

  static void pop() => Modular.to.pop();

  const ServiceOrderCreateGeneralInfoSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderCreateController>();
    controller.getAllCropsToSelect();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BackgroundWidget(
        scrollable: false,
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.backArrow,
          title: AppStringsPortuguese.createServiceOrder,
          callback: () => ServiceOrderCreateGeneralInfoSecondPage.pop(),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Observer(builder: (context) {
            if (controller.isFirstLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  Observer(
                    builder: (context) => CustomAutocompleteCardWidget(
                      title: 'Cultura:',
                      itemList: controller.cropListToSelect,
                      onItemSelected: (SelectEntity item) {
                        controller.crop = item;
                        debugPrint('id: ${controller.crop}');
                        debugPrint('Selecionado: ${item.label}');
                        controller.getAllCropVarietiesByCropIdToSelect();
                      },
                      autoCompleteType: AutoCompleteType.simple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Observer(builder: (context) {
                    return controller.isCropVarietyLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomAutocompleteCardWidget(
                            title: 'Variedade:',
                            itemList: controller.cropVarietyListToSelect,
                            onItemSelected: (SelectEntity item) {
                              controller.cropVariety = item;
                              debugPrint('id: ${controller.cropVariety}');
                              debugPrint('Selecionado: ${item.label}');
                              controller.technologyName = null;
                              controller.getCropVarietyById();
                              controller.getAllCostCentersByCostCenterTypeIdToSelect();
                            },
                            autoCompleteType: AutoCompleteType.simple,
                          );
                  }),
                  SizedBox(height: 10),
                  Observer(builder: (BuildContext context) {
                    return controller.isTechnologyLoading
                        ? Center(child: CircularProgressIndicator())
                        : controller.technologyName != null
                            ? CustomSimpleInfoCardWidget(
                                label: 'Tecnologia', data: '${controller.technologyName}')
                            : Container();
                  }),
                  SizedBox(height: 10),
                  CustomTextInputWidget(
                    title: 'Numero da Ordem de Colheita',
                    getText: (answer) {
                      controller.harvestOrder = answer;
                    },
                  ),
                  SizedBox(height: 10),
                  Observer(
                    builder: (context) {
                      return controller.isCostCenterLoading
                          ? Center(child: CircularProgressIndicator())
                          : CustomAutocompleteCardWidget(
                              title: 'Safra:',
                              itemList:
                                  controller.costCenterByCostCenterTypeIdListToSelect,
                              onItemSelected: (SelectEntity item) {
                                controller.costCenterByCostCenterTypeId = item;
                                debugPrint(
                                    'id: ${controller.costCenterByCostCenterTypeId}');
                                debugPrint('Selecionado: ${item.label}');
                              },
                              autoCompleteType: AutoCompleteType.simple,
                            );
                    },
                  ),
                  Expanded(child: SizedBox(height: 10,)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () => ServiceOrderCreateGeneralInfoSecondPage.pop(),
                            label: 'Anterior',
                            textColor: AppColors.primaryBlackColor,
                            backgroundColor: AppColors.backgroundColor,
                            borderColor: AppColors.formGreyColor,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                            },
                            label: 'Próximo',
                            backgroundColor: AppColors.primaryGreenColor,
                            borderColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
