import 'package:flutter/material.dart';
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
