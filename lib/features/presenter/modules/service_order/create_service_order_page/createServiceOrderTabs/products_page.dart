import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../design_system/colors/app_colors.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../widgets/custom_card_logo/custom_card_logo_widget.dart';
import '../../../../widgets/custom_selector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class ProductsPage extends StatelessWidget {

  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    return Observer(
          builder: (context) => Column(
            children: [
              CustomSelectorWidget(
                  onSelect: (value) {
                    controller.selectedProducts.add(value.value);
                  },
                  items: controller.productsOptions,
                  title: AppStringsPortuguese.productSelectorTitle,
                  selectorHint: AppStringsPortuguese.productSelectorHint),
              const SizedBox(height: 6),
              const Divider(
                height: 1,
                color: AppColors.dividerGreyColor,
              ),
              const SizedBox(height: 6),
              Expanded(
                  child: ListView.separated(
                    itemCount: controller.selectedProducts.length,
                    itemBuilder: (context, index) {
                      return Observer(
                          builder: (context) => CustomCardLogoWidget(
                            index: index,
                            labelOne: AppStringsPortuguese.productField,
                            textOne:"",// controller.selectedProducts[index],
                            labelTwo: AppStringsPortuguese.quantityField,
                            textTwo: "Quantidade",
                            labelThree: AppStringsPortuguese.recommendationField,
                            textThree: "Recomendação",
                            icon: Icons.delete_outline,
                            onIconTap: (index) {
                              controller.selectedProducts.removeAt(index);
                            },
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 4);
                    },
                  ))
            ],
          ));
    }

}
