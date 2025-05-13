import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_card_widget.dart';

import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/custom_autocomplete/custom_autocomplete_widget.dart';
import '../../../widgets/custom_date_picker/custom_date_picker_widget.dart';


class PurchaseRequestCreatePaymentMethodPage extends StatelessWidget {
  static const routePath = AppRoutes.addPurchaseRequestCreatePaymentMethodPage;

  static void push() => Modular.to.pushNamed(routePath);

  static void pop() => Modular.to.pop();
  const PurchaseRequestCreatePaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<PurchaseRequestCreateController>();
    controller.getAllPaymentMethodsToSelect();

    return BackgroundWidget(
        scrollable: true,
        appBar:    CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStringsPortuguese.newPurchaseRequestString,
          callback: () => PurchaseRequestCreatePaymentMethodPage.pop(),
        ),
        child:    Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Observer(
            builder: (context) {
              if(controller.isPaymentMethodLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (BuildContext context) => CustomAutocompleteCardWidget(
                        title: 'Forma de Pagamento',
                        itemList: controller.paymentMethodListToSelect,
                        onItemSelected: (SelectEntity selectedItem) {
                          controller.paymentMethod = selectedItem;
                          debugPrint('id: ${controller.purchaseRequestType}');
                          debugPrint('Selecionado: ${selectedItem.label}');
                        },
                        autoCompleteType: AutoCompleteType.simple,
                    )),
                    CustomDatePickerWidget(
                        title: 'Data de Pagamento',
                        getSelectedDate: (date) {
                          controller.paymentDate = date;
                        }),
                    const SizedBox(height: 10),
                    Card(
                      color: AppColors.primaryWhiteColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Observer(
                              builder: (context) {
                                return Checkbox(
                                  value: controller.isUrgent,
                                  onChanged: controller.finalRequestedCompanies.length > 1
                                  ? null
                                  : (value){
                                    controller.toggleIsUrgent(value);
                                  },
                                  activeColor: AppColors.primaryGreenColor,
                                );
                              }
                            ),
                            Text('Solicitação Urgente'),
                            SizedBox(width: 5),
                            Icon(Icons.info_outline, color: AppColors.primaryRedColor, size: 15)
                          ],
                        ),

                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              onPressed: () => PurchaseRequestCreatePaymentMethodPage.pop(),
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
                                controller.createPurchaseRequest(context);
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
            }
          ),
        ),
    );
  }
}
