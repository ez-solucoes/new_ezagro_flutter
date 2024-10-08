import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../consts/app_colors.dart';
import '../../../../../../consts/app_strings.dart';
import '../../../../../../consts/app_text_styles.dart';
import '../../../../widgets/buttons/custom_outlined_button.dart';
import '../../../../widgets/customCheckableListItem/custom_checkable_list_item_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class SelectPlotsPage extends StatelessWidget {

  const SelectPlotsPage({super.key});

  void dispose() {
    Modular.get<CreateServiceOrderController>().scrollController.dispose();
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    controller.getPlotsOptions();
    return Observer(
        builder: (context) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomOutlinedButton(
                  onPressed: () {
                    controller.toggleSelectAll();
                  },
                  label: AppStrings.selectAllButton,
                  textStyle: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor)),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: AppColors.contourWhiteColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(children: [
                        CustomCheckableListItemWidget(
                            isHeader: true,
                            firstColumn: AppStrings.plotColumn,
                            secondColumn: AppStrings.areaColumn,
                            thirdColumn: AppStrings.cropColumn,
                            index: 0,
                            onCheckBoxTap: (index) {}),
                        Expanded(
                            child: GestureDetector(
                          onLongPressStart: controller.onLongPressStart,
                          onLongPressEnd: controller.onLongPressEnd,
                          onLongPressMoveUpdate: controller.onLongPressUpdate,
                          child: ListView.builder(
                              controller: controller.scrollController,
                              itemCount: controller.plotsOptions.length,
                              itemBuilder: (context, index) {
                                return Observer(
                                    builder: (context) => SizedBox(
                                          height: controller.itemHeight,
                                          child: CustomCheckableListItemWidget(
                                              indexIsChecked: controller.selectedPlots
                                                  .contains(controller.plotsOptions[index].id),
                                              firstColumn: controller.plotsOptions[index].id.toString(),
                                              secondColumn: controller.plotsOptions[index].area.toString(),
                                              thirdColumn: controller.plotsOptions[index].plotGroup.name,
                                              index: index,
                                              onCheckBoxTap: (index) {
                                                if (controller.selectedPlots
                                                    .contains(
                                                    controller.plotsOptions[index].id)) {
                                                  controller.selectedPlots
                                                      .removeWhere((e) =>
                                                  controller.plotsOptions[index].id == e);
                                                } else {
                                                  controller.selectedPlots
                                                      .add(controller.plotsOptions[index].id);
                                                }
                                              }),
                                        ));
                              }),
                        ))
                      ])))
            ]));
  }
}
