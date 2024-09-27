import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../modules/presenter/widgets/customCardLogo/custom_card_logo_widget.dart';
import '../../../../../modules/presenter/widgets/customSelector/custom_selector_widget.dart';
import '../../controllers/create_service_order_controller/create_service_order_controller.dart';

class MachineryPage extends StatelessWidget {
  CreateServiceOrderController controller;

  MachineryPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Column(
              children: [
                CustomSelectorWidget(
                    onSelect: (value) {
                      controller.selectedMachinery.add(value);
                    },
                    items: const ["máquina 1", "máquina 2", "máquina 3"],
                    title: AppStrings.machinerySelectorTitle,
                    selectorHint: AppStrings.machinerySelectorHint),
                const SizedBox(height: 6),
                const Divider(
                  height: 1,
                  color: AppColors.softGreyColor,
                ),
                const SizedBox(height: 6),
                Expanded(
                    child: ListView.separated(
                  itemCount: controller.selectedMachinery.length,
                  itemBuilder: (context, index) {
                    return Observer(
                        builder: (context) => CustomCardLogoWidget(
                              index: index,
                              labelOne: AppStrings.machineryField,
                              textOne: controller.selectedMachinery[index],
                              labelTwo: AppStrings.machineryAliasField,
                              textTwo: controller.selectedMachinery[index],
                              labelThree: AppStrings.hourMeterField,
                              textThree: "Horímetro",
                              labelFour: AppStrings.kiloMeterField,
                              textFour: "Quilometragem",
                              icon: Icons.delete_outline,
                              logo: Icons.agriculture_sharp,
                              onIconTap: (index) {
                                controller.selectedMachinery.removeAt(index);
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
