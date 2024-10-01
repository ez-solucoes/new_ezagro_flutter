import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../../consts/app_colors.dart';
import '../../../../../../consts/app_strings.dart';
import '../../../../widgets/customInfoCard/custom_info_card_widget.dart';
import '../../../../widgets/customSelector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class ExecutorsPage extends StatelessWidget {

  CreateServiceOrderController controller;

  ExecutorsPage({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) =>
            Column(
              children: [
                CustomSelectorWidget(
                    onSelect: (value) {
                      controller.selectedExecutors.add(value);
                    },
                    items: ["executores 1", "ex 2", "ex 3"],
                    title: AppStrings.executorSelectorTitle,
                    selectorHint: AppStrings.executorSelectorHint),
                const SizedBox(height: 6),
                const Divider(
                  height: 1,
                  color: AppColors.softGreyColor,
                ),
                const SizedBox(height: 6),
                Expanded(
                    child: ListView.separated(
                      itemCount: controller.selectedExecutors.length,
                      itemBuilder: (context, index) {
                        return CustomInfoCardWidget(
                          index: index,
                          infoCardType: InfoCardType.threeLabeledInfoWithIcon,
                          labelOne: AppStrings.nameField,
                          textOne: controller.selectedExecutors[index],
                          labelTwo: AppStrings.idField,
                          textTwo: "00.000.000-00",
                          labelThree: AppStrings.shiftField,
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