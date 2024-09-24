import 'package:flutter/material.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../modules/presenter/widgets/customDatePicker/custom_date_picker_widget.dart';
import '../../../../../modules/presenter/widgets/customSelector/custom_selector_widget.dart';
import '../../controllers/create_service_order_controller/create_service_order_controller.dart';

class SchedulePage extends StatelessWidget {
  CreateServiceOrderController controller;

  SchedulePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDatePickerWidget(
          title: AppStrings.expectedStartDate,
          getSelectedDate: (date) {
            controller.startDate["startDate"] = date;
          },
        ),
        CustomDatePickerWidget(
            title: AppStrings.expectedFinishingDate,
            getSelectedDate: (date) {
              controller.endDate["endDate"] = date;
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
