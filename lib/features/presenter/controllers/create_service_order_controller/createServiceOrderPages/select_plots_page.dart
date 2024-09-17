import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../consts/app_text_styles.dart';
import '../../../../../modules/presenter/widgets/buttons/custom_outlined_button.dart';
import '../../../../../modules/presenter/widgets/customCheckableListItem/custom_checkable_list_item_widget.dart';
import '../create_service_order_controller.dart';

class SelectPlotsPage extends StatelessWidget {

  CreateServiceOrderController controller;

  SelectPlotsPage({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
      List<List<String>> plots = List.generate(50, (index) {
        return [(index).toString(), '100ha', 'milho'];
      });
      return Observer(
          builder: (context) =>
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomOutlinedButton(
                    onPressed: () {controller.toggleSelectAll();},
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
                              onCheckBoxTap: (index){}),
                          Expanded(
                              child: ListView.builder(
                                  itemCount: plots.length,
                                  itemBuilder: (context, index) {
                                    return Observer(
                                        builder: (context) => CustomCheckableListItemWidget(
                                            indexIsChecked: controller.selectAll,
                                            firstColumn: plots[index][0],
                                            secondColumn: plots[index][1],
                                            thirdColumn: plots[index][2],
                                            index: index,
                                            onCheckBoxTap: (index) {
                                              if (controller.plots.contains(plots[index][0])) {
                                                controller.plots.removeWhere((e) => plots[index][0] == e);
                                              } else {
                                                controller.plots.add(plots[index][0]);
                                              }
                                              controller.selectedPlots["plots"] = controller.plots;
                                            }));
                                  }))
                        ])))
              ]));
  }

}