import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/create_service_order_controller.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../modules/presenter/widgets/customSelector/custom_selector_widget.dart';

class GeneralInformationPage extends StatelessWidget {

  CreateServiceOrderController controller;

  GeneralInformationPage({
    super.key,
    required this.controller
  });


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomSelectorWidget(
          onSelect: (value) {
            controller.activity = {"activity": value};
          },
          items: const ["Atividade 01", "Atividade 02"],
          title: AppStrings.activitySelectorTitle,
          selectorHint: AppStrings.activitySelectorHint),
      const SizedBox(
        height: 5,
      ),
      CustomSelectorWidget(
          onSelect: (value) {
            controller.costCenterId = value;
          },
          items: const ["CC 01", "CC 02"],
          title: AppStrings.costCenterSelectorTitle,
          selectorHint: AppStrings.costCenterSelectorHint),
      const SizedBox(
        height: 5,
      ),
      CustomSelectorWidget(
          onSelect: (value) {
            controller.farmId = value;
          },
          items: const ["Fazenda 01", "Fazenda 02"],
          title: AppStrings.farmSelectorTitle,
          selectorHint: AppStrings.farmSelectorHint),
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
