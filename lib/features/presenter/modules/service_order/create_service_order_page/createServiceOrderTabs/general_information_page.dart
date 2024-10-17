import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../consts/app_strings.dart';
import '../../../../widgets/customSelector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class GeneralInformationPage extends StatelessWidget {

  GeneralInformationPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    controller.getActivities();
    controller.getCostCenters();
    controller.getSimplifiedFarms();
    return Column(children: [
      Observer(
        builder: (context) => CustomSelectorWidget(
            onSelect: (value) {
              controller.activity = controller.activityOptions.where((e) => e.activityName == value).toList().first;

            },
            items: controller.activityOptions.map((activity) => activity.activityName).toList(),
            title: AppStrings.activitySelectorTitle,
            selectorHint: AppStrings.activitySelectorHint,
            selectedValue: controller.activity?.activityName
          ),
      ),
      const SizedBox(
        height: 5,
      ),
      Observer(
        builder: (context) => CustomSelectorWidget(
            onSelect: (value) {
              controller.costCenterId = controller.costCenterOptions.where((e) => e.name == value).toList().first.id;
            },
            items: controller.costCenterOptions.map((costCenter) => costCenter.name ?? "").toList(),
            title: AppStrings.costCenterSelectorTitle,
            selectorHint: AppStrings.costCenterSelectorHint),
      ),
      const SizedBox(
        height: 5,
      ),
      Observer(
        builder: (context) => CustomSelectorWidget(
            onSelect: (value) {
              controller.farmId = value;
            },
            items: const ["Fazenda 01", "Fazenda 02"],
            title: AppStrings.farmSelectorTitle,
            selectorHint: AppStrings.farmSelectorHint),
      ),
      const SizedBox(
        height: 5,
      ),
      CustomSelectorWidget(
          onSelect: (value) {
            controller.harvest = {"harvest": value};
          },
          items: const ["Safra 01", "Safra 02"],
          title: AppStrings.harvestSelectorTitle,
          selectorHint: AppStrings.harvestSelectorHint)
    ]);
  }
}
