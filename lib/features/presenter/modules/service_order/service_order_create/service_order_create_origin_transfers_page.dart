import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/miscellaneous/item_selection_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/miscellaneous/view_listed_itens/view_listed_items_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_create/service_order_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_card_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../widgets/address_info_card/address_info_card.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';

class ServiceOrderCreateOriginTransfersPage extends StatelessWidget {
  static final String routePath = AppRoutes.appServiceOrderCreateOriginTransfersPage;

  static void navigate() => Modular.to.navigate(routePath);

  static Future<Object?> push() => Modular.to.pushNamed(routePath);

  static void pop() => Modular.to.pop();

  const ServiceOrderCreateOriginTransfersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderCreateController>();
    controller.getAllStocksToSelect();

    return BackgroundWidget(
      scrollable: false,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: AppStringsPortuguese.createServiceOrder,
        callback: () => ServiceOrderCreateOriginTransfersPage.pop(),
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
                          title: 'Origem',
                          itemList: controller.stockListToSelect,
                          onItemSelected: (SelectEntity selectedItem) async {
                            final result = await controller.getStockById(selectedItem.value);
                            result.fold((error) {
                              CustomSnackBarWidget.show(SnackBarType.alert, context, error.friendlyMessage);
                            }, (success) {
                              controller.originStock = success.data;
                            });
                          },
                          autoCompleteType: AutoCompleteType.simple,
                        )),
                SizedBox(height: 10),
                Observer(builder: (context) {
                  if (controller.originStock != null) {
                    return controller.isOriginLoading
                        ? const Center(child: CircularProgressIndicator())
                        : AddressInfoCard(
                            trailingIcon: Icons.map_outlined,
                            onIconTap: () {},
                            addressInfo: [
                              {'label': 'Origem: ', 'value': controller.originStock?.name},
                              {
                                'label': 'Endereço: ',
                                'value':
                                    '${controller.originStock?.addressStreet}, ${controller.originStock?.addressNumber}'
                              },
                              {'label': 'Bairro: ', 'value': '${controller.originStock?.addressNeighborhood}'},
                              {'label': 'Cidade: ', 'value': '${controller.originStock?.addressCity}'},
                              {'label': 'CEP: ', 'value': '${controller.originStock?.addressCity}'},
                            ],
                          );
                  } else {
                    return Container();
                  }
                }),
                SizedBox(height: 10),
                Observer(
                    builder: (context) => CustomAutocompleteCardWidget(
                          title: 'Destino',
                          itemList: controller.stockListToSelect,
                          onItemSelected: (SelectEntity selectedItem) async {
                            controller.isDestinationLoading = true;
                            final result = await controller.getStockById(selectedItem.value);
                            result.fold((error) {
                              CustomSnackBarWidget.show(SnackBarType.alert, context, error.friendlyMessage);
                            }, (success) {
                              controller.destinationStock = success.data;
                            });
                            controller.isDestinationLoading = false;
                          },
                          autoCompleteType: AutoCompleteType.simple,
                        )),
                SizedBox(height: 10),
                Observer(builder: (context) {
                  if (controller.destinationStock != null) {
                    return controller.isDestinationLoading
                        ? const Center(child: CircularProgressIndicator())
                        : AddressInfoCard(
                        trailingIcon: Icons.map_outlined,
                        onIconTap: () {},
                        addressInfo: [
                            {'label': 'Destino: ', 'value': controller.destinationStock?.name},
                            {
                              'label': 'Endereço: ',
                              'value':
                                  '${controller.destinationStock?.addressStreet}, ${controller.destinationStock?.addressNumber}'
                            },
                            {'label': 'Bairro: ', 'value': '${controller.destinationStock?.addressNeighborhood}'},
                            {'label': 'Cidade: ', 'value': '${controller.destinationStock?.addressCity}'},
                            {'label': 'CEP: ', 'value': '${controller.destinationStock?.addressCity}'},
                          ]);
                  } else {
                    return Container();
                  }
                }),
                Expanded(child: SizedBox(height: 10)),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
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
                            if(controller.originStock == null || controller.destinationStock == null){
                              CustomSnackBarWidget.show(SnackBarType.alert, context, 'Selecione a origem e o destino!');
                            } else{
                              ViewListedItemsPage(args: ArgParams(firstArgs: ItemType.product));
                            }
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
      ),
    );
  }
}
