import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../consts/app_colors.dart';
import '../../../../../../consts/app_strings.dart';
import '../../../../widgets/customDoubleSelector/custom_double_selector_widget.dart';
import '../../../../widgets/customTextInput/custom_text_input_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class FinalInformationPage extends StatelessWidget {

  FinalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    return Column(
      children: [
        CustomDoubleSelectorWidget(
            onSelectFirst: (value) {
              controller.costCenterId = value;
            },
            itemsOne: const [
              "C. de custo 01",
              "C. de custo 02",
              "C. de custo 03"
            ],
            titleOne: AppStrings.finalCostCenterSelector,
            selectorHintOne: AppStrings.finalCostCenterSelectorHint,
            onSelectSecond: (value) {

            },
            itemsTwo: const ["Estoque 01", "Estoque 02"],
            titleTwo: AppStrings.finalStorageSelector,
            selectorHintTwo: AppStrings.finalStorageSelectorHint),
        const SizedBox(height: 12),
        const Divider(
          height: 1,
          color: AppColors.softGreyColor,
        ),
        const SizedBox(height: 6),
        CustomTextInputWidget(
          title: AppStrings.jobValueTextFieldTitle,
          getText: (answer) {
            controller.activityValue = double.parse(answer);
          },
        ),
        const SizedBox(height: 6),
        CustomTextInputWidget(
          title: AppStrings.notesTextFieldTitle,
          getText: (answer) {
            controller.notes = answer;
          },
        )
      ],
    );
  }
}
