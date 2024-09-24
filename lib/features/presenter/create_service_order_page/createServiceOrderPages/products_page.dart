import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../modules/presenter/widgets/customCardLogo/custom_card_logo_widget.dart';
import '../../../../../modules/presenter/widgets/customSelector/custom_selector_widget.dart';
import '../../controllers/create_service_order_controller/create_service_order_controller.dart';

class ProductsPage extends StatelessWidget {

  CreateServiceOrderController controller;

  ProductsPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(
          builder: (context) => Column(
            children: [
              CustomSelectorWidget(
                  onSelect: (value) {
                    controller.products.add(value);
                    controller.selectedProducts["products"] = controller.products;
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
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Observer(
                          builder: (context) => CustomCardLogoWidget(
                            index: index,
                            labelOne: AppStrings.productField,
                            textOne: controller.products[index],
                            labelTwo: AppStrings.quantityField,
                            textTwo: "Quantidade",
                            labelThree: AppStrings.recommendationField,
                            textThree: "Recomendação",
                            icon: Icons.delete_outline,
                            onIconTap: (index) {
                              controller.products.removeAt(index);
                              controller.selectedProducts["products"] = controller.products;
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
