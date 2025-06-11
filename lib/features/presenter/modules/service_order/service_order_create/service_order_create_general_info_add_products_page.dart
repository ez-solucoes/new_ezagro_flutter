import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_create/service_order_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_elevated_button.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';

class ServiceOrderCreateGeneralInfoAddProductsPage extends StatelessWidget {
  static const String routePath =
      AppRoutes.appServiceOrderCreateGeneralInfoAddProductsPage;

  static void navigate() => Modular.to.navigate(routePath);

  static Future<Object?> push() => Modular.to.pushNamed(routePath);

  static void pop() => Modular.to.pop();

  const ServiceOrderCreateGeneralInfoAddProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderCreateController>();

    return BackgroundWidget(
      scrollable: false,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: AppStringsPortuguese.createServiceOrder,
        callback: () => ServiceOrderCreateGeneralInfoAddProductsPage.pop(),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Observer(
          builder: (BuildContext context) {
            if (controller.isFirstLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Adicione os produtos e insumos que serão usados nessa Ordem de Serviço',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyTextStyle(
                        color: AppColors.primaryBlackColor),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: CustomElevatedButton(
                      onPressed: () {},
                      label: 'Adicionar produto/insumo',
                    ),
                  ),
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
          },
        ),
      ),
    );
  }
}
