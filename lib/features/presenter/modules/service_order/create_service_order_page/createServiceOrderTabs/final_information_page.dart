import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../design_system/colors/app_colors.dart';
import '../../../../../../design_system/strings/app_strings.dart';
import '../../../../widgets/custom_double_selector/custom_double_selector_widget.dart';
import '../../../../widgets/custom_text_input/custom_text_input_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class FinalInformationPage extends StatelessWidget {
  const FinalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    return Column(
      children: [
        CustomDoubleSelectorWidget(
            onSelectFirst: (value) {},
            itemsOne: const [
              "C. de custo 01",
              "C. de custo 02",
              "C. de custo 03"
            ],
            titleOne: AppStringsPortuguese.finalCostCenterSelector,
            selectorHintOne: AppStringsPortuguese.finalCostCenterSelectorHint,
            onSelectSecond: (value) {},
            itemsTwo: const ["Estoque 01", "Estoque 02"],
            titleTwo: AppStringsPortuguese.finalStorageSelector,
            selectorHintTwo: AppStringsPortuguese.finalStorageSelectorHint),
        const SizedBox(height: 12),
        const Divider(
          height: 1,
          color: AppColors.softGreyColor,
        ),
        const SizedBox(height: 6),
        CustomTextInputWidget(
          title: AppStringsPortuguese.jobValueTextFieldTitle,
          getText: (answer) {
            controller.activityValue = double.parse(answer);
          },
        ),
        const SizedBox(height: 6),
        CustomTextInputWidget(
          title: AppStringsPortuguese.notesTextFieldTitle,
          getText: (answer) {
            controller.notes = answer;
          },
        )
      ],
    );
  }
}
