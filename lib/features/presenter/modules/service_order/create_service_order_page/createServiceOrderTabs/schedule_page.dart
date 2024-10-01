import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../consts/app_strings.dart';
import '../../../../widgets/customDatePicker/custom_date_picker_widget.dart';
import '../../../../widgets/customSelector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class SchedulePage extends StatelessWidget {

  SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    return Column(
      children: [
        CustomDatePickerWidget(
          title: AppStrings.expectedStartDate,
          getSelectedDate: (date) {
            controller.startDate = date;
          },
        ),
        CustomDatePickerWidget(
            title: AppStrings.expectedFinishingDate,
            getSelectedDate: (date) {
              controller.endDate = date;
            }),
        CustomSelectorWidget(
            onSelect: (value) {
              controller.responsible["responsible"] = value;
            },
            items: [
              "Responsável 01",
              "Responsávl 02",
              "Responsável 03",
              "Responsável 04",
            ],
            title: AppStrings.responsiveSelectorTitle,
            selectorHint: AppStrings.responsibleSelectorHint)
      ],
    );
  }
}
