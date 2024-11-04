import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../widgets/custom_date_picker/custom_date_picker_widget.dart';
import '../../../../widgets/custom_selector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class SchedulePage extends StatelessWidget {

  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    return Column(
      children: [
        CustomDatePickerWidget(
          title: AppStringsPortuguese.expectedStartDate,
          getSelectedDate: (date) {
            controller.startDate = date;
          },
        ),
        CustomDatePickerWidget(
            title: AppStringsPortuguese.expectedFinishingDate,
            getSelectedDate: (date) {
              controller.endDate = date;
            }),
        CustomSelectorWidget(
            onSelect: (value) {
              controller.responsible["responsible"] = value;
            },
            items: controller.employeeOptions,
            title: AppStringsPortuguese.responsiveSelectorTitle,
            selectorHint: AppStringsPortuguese.responsibleSelectorHint)
      ],
    );
  }
}
