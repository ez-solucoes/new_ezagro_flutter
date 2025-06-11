import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_list_items_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_list/purchase_request_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_card_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../miscellaneous/item_selection_controller.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/custom_autocomplete/custom_autocomplete_widget.dart';

class PurchaseRequestCreateGeneralInfoFirstPage extends StatelessWidget {
  static const String routePath = AppRoutes.appPurchaseRequestCreateGeneralInfoFirstPage;

  static void navigate() => Modular.to.navigate(routePath);

  static void push() => Modular.to.pushNamed(routePath);

  static void pop() => Modular.to.pop();

  const PurchaseRequestCreateGeneralInfoFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<PurchaseRequestCreateController>();
    controller.getAllPurchaseRequestTypeToSelect();
    controller.getAllCostCentersByCostCenterTypeIdToSelect();

    return BackgroundWidget(
        scrollable: true,
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStringsPortuguese.newPurchaseRequestString,
          callback: () => PurchaseRequestListPage.navigate(),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Observer(builder: (context) {
            if (controller.isFirstLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  Observer(
                    builder: (BuildContext context) => CustomAutocompleteCardWidget(
                      title: 'Tipo de Solicitação',
                      itemList: controller.purchaseRequestTypeListToSelect,
                      onItemSelected: (SelectEntity selectedItem) {
                        controller.purchaseRequestType = selectedItem;
                        debugPrint('id: ${controller.purchaseRequestType}');
                        debugPrint('Selecionado: ${selectedItem.label}');
                      },
                      autoCompleteType: AutoCompleteType.simple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Observer(
                    builder: (BuildContext context) => CustomAutocompleteCardWidget(
                      title: 'Centro de custo',
                      itemList: controller.costCenterByCostCenterTypeIdListToSelect,
                      onItemSelected: (SelectEntity selectedItem) {
                        controller.updateCostCenterAndReload(selectedItem);
                        debugPrint('id: ${controller.costCenter}');
                        debugPrint('Selecionado: ${selectedItem.label}');
                      },
                      autoCompleteType: AutoCompleteType.simple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Observer(builder: (BuildContext context) {
                    if (controller.isFarmLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return CustomAutocompleteCardWidget(
                        title: 'Fazenda',
                        itemList: controller.farmsByCostCenterIdListToSelect,
                        onItemSelected: (SelectEntity selectedItem) {
                          controller.updateFarmAndReload(selectedItem);
                          debugPrint('id: ${controller.farm?.value}');
                          debugPrint('Selecionado: ${selectedItem.label}');
                        },
                        autoCompleteType: AutoCompleteType.simple,
                        // initialValue: controller.farm != null
                        //     ? controller.farmsByCostCenterIdListToSelect.firstWhere(
                        //         (item) => item.value == controller.farm?.value,
                        //         orElse: () => SelectEntity(value: 0, label: ''),
                        //       )
                        //     : null,
                      );
                    }
                  }),
                  SizedBox(height: 10),
                  Observer(
                    builder: (BuildContext context) =>
                    controller.isEmployeeLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomAutocompleteCardWidget(
                      title: 'Responsável',
                      itemList: controller.employeeByFarmIdListToSelect,
                      onItemSelected: (SelectEntity selectedItem) {
                        controller.updateEmployee(selectedItem);
                        debugPrint('Employee id: ${controller.employee?.value}');
                        debugPrint('Selecionado: ${selectedItem.label}');
                      },
                      autoCompleteType: AutoCompleteType.simple,
                      // initialValue:  controller.employee != null
                      // ? controller.employeeByFarmIdListToSelect.firstWhere((item) => item.value == controller.employee?.value,
                      //   orElse: () => SelectEntity(value: 0, label: ''),
                      // )
                      //     : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () => PurchaseRequestListPage.navigate(),
                            label: 'Cancelar',
                            textColor: AppColors.primaryBlackColor,
                            backgroundColor: AppColors.backgroundColor,
                            borderColor: AppColors.formGreyColor,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {

                              final SelectEntity? selectedRequestType = controller.purchaseRequestType;

                              if (selectedRequestType == null) {
                                CustomSnackBarWidget.show(
                                  SnackBarType.alert,
                                  context,
                                  'Por favor, selecione o Tipo de Solicitação antes de prosseguir.',
                                );
                                return;
                              }

                              ItemType targetItemType;
                              switch (selectedRequestType.value) {
                                case 1:
                                  targetItemType = ItemType.product;
                                  break;
                                case 2:
                                  targetItemType = ItemType.agriculturalInput;
                                  break;
                                case 3:
                                  CustomSnackBarWidget.show(
                                    SnackBarType.alert,
                                    context,
                                    'Solicitações de Serviço têm um fluxo diferente e não requerem lista de itens aqui.',
                                  );
                                  return;
                                default:
                                  CustomSnackBarWidget.show(
                                    SnackBarType.error,
                                    context,
                                    'Tipo de solicitação não reconhecido. Não é possível prosseguir.',
                                  );
                                  return;
                              }
                              PurchaseRequestCreateListItemsPage.push(args: ArgParams(firstArgs: targetItemType));
                            },
                            label: 'Próximo',
                            backgroundColor: AppColors.primaryGreenColor,
                            borderColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
        ));
  }
}
