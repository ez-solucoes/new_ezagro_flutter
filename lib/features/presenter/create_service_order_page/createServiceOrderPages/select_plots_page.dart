import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_strings.dart';
import '../../../../consts/app_text_styles.dart';
import '../../../../modules/presenter/widgets/buttons/custom_outlined_button.dart';
import '../../../../modules/presenter/widgets/customCheckableListItem/custom_checkable_list_item_widget.dart';
import '../../controllers/create_service_order_controller/create_service_order_controller.dart';

class SelectPlotsPage extends StatelessWidget {

  const SelectPlotsPage({super.key});

  // @override
  // void dispose() {
  //   controller.scrollController.dispose();
  //   dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();

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
                              itemCount: controller.mockPlots.length,
                              itemBuilder: (context, index) {
                                return Observer(
                                    builder: (context) => SizedBox(
                                          height: controller.itemHeight,
                                          child: CustomCheckableListItemWidget(
                                              indexIsChecked: controller.selectedPlots
                                                  .contains(controller.mockPlots[index][0]),
                                              firstColumn: controller.mockPlots[index][0],
                                              secondColumn: controller.mockPlots[index][1],
                                              thirdColumn: controller.mockPlots[index][2],
                                              index: index,
                                              onCheckBoxTap: (index) {
                                                if (controller.selectedPlots
                                                    .contains(
                                                    controller.mockPlots[index][0])) {
                                                  controller.selectedPlots
                                                      .removeWhere((e) =>
                                                  controller.mockPlots[index][0] == e);
                                                } else {
                                                  controller.selectedPlots
                                                      .add(controller.mockPlots[index][0]);
                                                }
                                              }),
                                        ));
                              }),
                        ))
                      ])))
            ]));
  }
}
