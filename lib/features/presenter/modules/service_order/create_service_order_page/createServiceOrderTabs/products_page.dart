import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../consts/app_colors.dart';
import '../../../../../../consts/app_strings.dart';
import '../../../../widgets/custom_card_logo/custom_card_logo_widget.dart';
import '../../../../widgets/custom_selector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class ProductsPage extends StatelessWidget {

  ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    return Observer(
          builder: (context) => Column(
            children: [
              CustomSelectorWidget(
                  onSelect: (value) {
                    controller.selectedProducts.add(value);
                  },
                  items: ["Produto 1", "Produto 2", "Produto 3"],
                  title: AppStrings.productSelectorTitle,
                  selectorHint: AppStrings.productSelectorHint),
              const SizedBox(height: 6),
              const Divider(
                height: 1,
                color: AppColors.softGreyColor,
              ),
              const SizedBox(height: 6),
              Expanded(
                  child: ListView.separated(
                    itemCount: controller.selectedProducts.length,
                    itemBuilder: (context, index) {
                      return Observer(
                          builder: (context) => CustomCardLogoWidget(
                            index: index,
                            labelOne: AppStrings.productField,
                            textOne: controller.selectedProducts[index],
                            labelTwo: AppStrings.quantityField,
                            textTwo: "Quantidade",
                            labelThree: AppStrings.recommendationField,
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
