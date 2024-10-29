import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../design_system/colors/app_colors.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../widgets/custom_card_logo/custom_card_logo_widget.dart';
import '../../../../widgets/custom_selector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class MachineryPage extends StatelessWidget {
  const MachineryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    return Observer(
        builder: (context) => Column(
              children: [
                CustomSelectorWidget(
                    onSelect: (value) {
                      controller.selectedMachinery.add(value);
                    },
                    items: const ["máquina 1", "máquina 2", "máquina 3"],
                    title: AppStringsPortuguese.machinerySelectorTitle,
                    selectorHint: AppStringsPortuguese.machinerySelectorHint),
                const SizedBox(height: 6),
                const Divider(
                  height: 1,
                  color: AppColors.dividerGreyColor,
                ),
                const SizedBox(height: 6),
                Expanded(
                    child: ListView.separated(
                  itemCount: controller.selectedMachinery.length,
                  itemBuilder: (context, index) {
                    return Observer(
                        builder: (context) => CustomCardLogoWidget(
                              index: index,
                              labelOne: AppStringsPortuguese.machineryField,
                              textOne: controller.selectedMachinery[index],
                              labelTwo: AppStringsPortuguese.machineryAliasField,
                              textTwo: controller.selectedMachinery[index],
                              labelThree: AppStringsPortuguese.hourMeterField,
                              textThree: "Horímetro",
                              labelFour: AppStringsPortuguese.kiloMeterField,
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
