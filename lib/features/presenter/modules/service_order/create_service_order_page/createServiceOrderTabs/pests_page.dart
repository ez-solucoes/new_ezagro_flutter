import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../design_system/colors/app_colors.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../widgets/custom_info_card/custom_info_card_widget.dart';
import '../../../../widgets/custom_selector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class PestsPage extends StatelessWidget {


  const PestsPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    controller.getExecutorOptions();
    return Observer(
        builder: (context) =>
            Column(
              children: [
                CustomSelectorWidget(
                    onSelect: (value) {
                      controller.selectedExecutors.add(value.id);
                    },
                    items: controller.executorsOptions,
                    title: AppStringsPortuguese.pestsSelectorTitle,
                    selectorHint: AppStringsPortuguese.executorSelectorHint),
                const SizedBox(height: 6),
                const Divider(
                  height: 1,
                  color: AppColors.dividerGreyColor,
                ),
                const SizedBox(height: 6),
                Expanded(
                    child: ListView.separated(
                      itemCount: controller.selectedExecutors.length,
                      itemBuilder: (context, index) {
                        return CustomInfoCardWidget(
                          index: index,
                          infoCardType: InfoCardType.threeLabeledInfoWithIcon,
                          labelOne: AppStringsPortuguese.nameField,
                          textOne: "",//controller.selectedExecutors[index],
                          labelTwo: AppStringsPortuguese.idField,
                          textTwo: "00.000.000-00",
                          labelThree: AppStringsPortuguese.shiftField,
                          textThree: "Matutino",
                          icon: Icons.delete_outline,
                          onIconTap: (index) {
                            controller.selectedExecutors.removeAt(index);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 4);
                      },
                    ))
              ],
            ));
  }
}