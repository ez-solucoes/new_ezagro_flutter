import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_create/service_order_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/custom_tiles/custom_four_items_alternate_color_label_widget.dart';

class ServiceOrderCreatePlotListPage extends StatelessWidget {
  static const String routePath = AppRoutes.appServiceOrderCreatePlotListPage;

  static void navigate() => Modular.to.navigate(routePath);

  static Future<Object?> push() => Modular.to.pushNamed(routePath);

  static void pop() => Modular.to.pop();

  const ServiceOrderCreatePlotListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderCreateController>();

    return BackgroundWidget(
      scrollable: false,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.backArrow,
        title: AppStringsPortuguese.createServiceOrder,
        callback: () => ServiceOrderCreatePlotListPage.pop(),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Observer(builder: (context) {
          if (controller.isFirstLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Adicionar Talhões',
                    style: AppTextStyles.underlinedTextButtonStyle(
                        color: AppColors.primaryBlackColor),
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Column(
                        children: [
                          CustomFourItemsAlternateColorLabelWidget(
                            firstLabel: 'Talhão',
                            secondLabel: 'Área',
                            thirdLabel: 'Cultura',
                            fourthLabel: 'Área',
                          ),
                          SizedBox(height: 10),
                          Divider(color: AppColors.borderWhiteColor),
                          Observer(builder: (context) {
                            if (controller.selectedFarmPlotList.isNotEmpty) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.selectedFarmPlotList.length,
                                itemBuilder: (context, index){
                                  return null;
                                },
                              );
                            } else {
                              return Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  'Nenhum Talhão selecionado para a solicitação!.',
                                  style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                          }),
                        ],
                      ),
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
                          onPressed: () {},
                          label: 'Voltar',
                          textColor: AppColors.primaryBlackColor,
                          backgroundColor: AppColors.backgroundColor,
                          borderColor: AppColors.formGreyColor,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            if(controller.selectedFarmPlotList.isEmpty) {
                              CustomSnackBarWidget.show(
                                SnackBarType.alert,
                                context,
                                'Selecione pelo menos um Talhão.',
                              );
                            }
                            // if (finalItemsList.isEmpty) {
                            //   CustomSnackBarWidget.show(
                            //     SnackBarType.alert,
                            //     context,
                            //     currentItemType == ItemType.product
                            //         ? 'Selecione pelo menos um produto.'
                            //         : 'Selecione pelo menos uma empresa.',
                            //   );
                            // } else {
                            //   if (currentItemType == ItemType.product) {
                            //     PurchaseRequestCreateListItemsPage.push(args: ArgParams(firstArgs: ItemType.company));
                            //   } else {
                            //     PurchaseRequestCreateDeliveryPage.push();
                            //   }
                            // }
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
