import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_create/service_order_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_card_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
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

    return BackgroundWidget(
        scrollable: false,
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStringsPortuguese.createServiceOrder,
          callback: () => ServiceOrderCreateOriginTransfersPage.pop(),
        ),

        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Observer(builder: (context){
            if(controller.isFirstLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  Observer(builder: (context) => CustomAutocompleteCardWidget(
                      title: 'Origem',
                      itemList: controller.originListToSelect,
                      onItemSelected: (SelectEntity selectedItem){
                        controller.origin = selectedItem.label;
                      },
                      autoCompleteType: AutoCompleteType.simple,
                  )),
                  SizedBox(height: 10),
                  Observer(builder: (context) => CustomAutocompleteCardWidget(
                    title: 'Destino',
                    itemList: controller.destinationListToSelect,
                    onItemSelected: (SelectEntity selectedItem){
                      controller.destination = selectedItem.label;
                    },
                    autoCompleteType: AutoCompleteType.simple,
                  )),
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
                            onPressed: () {},
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
