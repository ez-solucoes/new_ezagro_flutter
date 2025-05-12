import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
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
    SelectEntity? harvest;
    SelectEntity? selectedActivity;
    return SingleChildScrollView(
      child: Column(children: [
        Observer(
          builder: (context) => CustomSelectorWidget(
              onSelect: (value) {
                  controller.activity = controller.activityOptions.firstWhere((e) => e.id == value.value);
                  selectedActivity = value;
              },
              items: controller.activityOptions.map((e) => SelectEntity(value: e.id, label: e.activityName)).toList(),
              title: AppStringsPortuguese.activitySelectorTitle,
              selectorHint: AppStringsPortuguese.activitySelectorHint,
              selectedValue: selectedActivity,
              onSelectSubCategory: (value){
                controller.subActivity = value;
              },
              subItems: controller.subActivitiesOptions,
              subSelectorHint: AppStringsPortuguese.subActivitySelectorHint,
              selectedSubValue: controller.subActivity,
              reloadSubItems: (){controller.getSubActivities();},
            ),
        ),
        const SizedBox(
          height: 5,
        ),
        Observer(
          builder: (context) => CustomSelectorWidget(
              onSelect: (value) {
                // controller.costCenterId = controller.costCenterOptions.where((e) => e?.label! == value.label).toList().first.value;
                // if (controller.costCenterId != null) {
                //   controller.getCostCenterFarms(controller.costCenterId.toString());
                // }
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

                },
              items: controller.farmOptions.map((e) =>
                  SelectEntity(value: e.id, label: e.name)
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
                items: [],
                title: AppStringsPortuguese.harvestSelectorTitle,
                selectorHint: AppStringsPortuguese.harvestSelectorHint),
          ),
        )
      ]),
    );
  }
}
