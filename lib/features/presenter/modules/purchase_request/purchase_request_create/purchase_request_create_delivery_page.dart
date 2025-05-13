import 'package:flutter/material%202.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_payment_method_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_date_picker/custom_date_picker_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/custom_autocomplete/custom_autocomplete_card_widget.dart';
import '../../../widgets/custom_autocomplete/custom_autocomplete_widget.dart';

class PurchaseRequestCreateDeliveryPage extends StatelessWidget {
  static const String routePath = AppRoutes.appPurchaseRequestCreateDeliveryPage;

  static void navigate() => Modular.to.navigate(routePath);

  static void push() => Modular.to.pushNamed(routePath);

  static void pop() => Modular.to.pop();

  const PurchaseRequestCreateDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<PurchaseRequestCreateController>();
    controller.getAllDeliveryLocationsToSelect();

    return BackgroundWidget(
      scrollable: false,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: AppStringsPortuguese.newPurchaseRequestString,
        callback: () => PurchaseRequestCreateDeliveryPage.pop(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Observer(builder: (context) {
          if (controller.isFirstLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                CustomDatePickerWidget(
                    title: 'Vencimento da Solicitação',
                    getSelectedDate: (date) {
                      controller.quotationExpirationDate = date;
                    }),
                SizedBox(height: 10),
                CustomAutocompleteCardWidget(
                  title: 'Local de Entrega',
                  itemList: controller.deliveryLocationListToSelect,
                  onItemSelected: (SelectEntity selectedItem) {
                    controller.deliveryLocationId = selectedItem;
                    debugPrint('id: ${controller.deliveryLocationId}');
                    debugPrint('Selecionado: ${selectedItem.label}');
                  },
                  autoCompleteType: AutoCompleteType.simple,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () => PurchaseRequestCreateDeliveryPage.pop(),
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
                            PurchaseRequestCreatePaymentMethodPage.push();
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
    );
  }
}
