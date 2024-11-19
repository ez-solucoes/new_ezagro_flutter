import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/selector_entities/selector_entity.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../widgets/custom_selector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class GeneralInformationPage extends StatelessWidget {

  const GeneralInformationPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    controller.getActivities();
    controller.getCostCenters();
    SelectorEntity? harvest;
    SelectorEntity? selectedActivity;
    return Column(children: [
      Observer(
        builder: (context) => CustomSelectorWidget(
            onSelect: (value) {
                controller.activity = controller.activityOptions.firstWhere((e) => e.id == value.id);
                selectedActivity = value;
            },
            items: controller.activityOptions.map((e) => SelectorEntity(id: e.id, name: e.activityName)).toList(),
            title: AppStringsPortuguese.activitySelectorTitle,
            selectorHint: AppStringsPortuguese.activitySelectorHint,
            selectedValue: selectedActivity
          ),
      ),
      const SizedBox(
        height: 5,
      ),
      Observer(
        builder: (context) => CustomSelectorWidget(
            onSelect: (value) {
              controller.costCenterId = controller.costCenterOptions.where((e) => e.name == value.name).toList().first.id;
              if (controller.costCenterId != null) {
                controller.getCostCenterFarms(controller.costCenterId.toString());
              }
            },
            items: controller.costCenterOptions,
            title: AppStringsPortuguese.costCenterSelectorTitle,
            selectorHint: AppStringsPortuguese.costCenterSelectorHint),
      ),
      const SizedBox(
        height: 5,
      ),
      Observer(
        builder: (context) => CustomSelectorWidget(
            onSelect: (value) {
                controller.farmId = value.id;
                CostCenterEntity? costCenter = controller.farmOptions.firstWhere((e) => e.id == value.id).costCenters?.firstWhere((e) => e.costCenterType?.name == "Safra");
                if (costCenter != null) {
                  harvest = SelectorEntity(id: costCenter.id, name: costCenter.costCenterName);
                }
                controller.getPlotsOptions();
              },
            items: controller.farmOptions.map((e) =>
                SelectorEntity(id: e.id, name: e.name)
            ).toList(),
            title: AppStringsPortuguese.farmSelectorTitle,
            selectorHint: AppStringsPortuguese.farmSelectorHint),
      ),
      const SizedBox(
        height: 5,
      ),
      Observer(
          builder: (context) => IgnorePointer(
          child: CustomSelectorWidget(
              selectedValue: harvest,
              onSelect: (value) { },
              items: harvest == null ? [] : [harvest!],
              title: AppStringsPortuguese.harvestSelectorTitle,
              selectorHint: AppStringsPortuguese.harvestSelectorHint),
        ),
      )
    ]);
  }
}
