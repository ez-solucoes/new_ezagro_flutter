import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import 'package:intl/intl.dart';

class CustomDatePickerWidget extends StatefulWidget {
  final String title;
  final Function(String) getSelectedDate;

  const CustomDatePickerWidget(
      {super.key, required this.title, required this.getSelectedDate});

  @override
  State<CustomDatePickerWidget> createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  DateTime selectedDate = DateTime.now();
  DateFormat df = DateFormat("dd/MM/yyyy");
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.value =
        TextEditingValue(text: df.format(selectedDate).toString());
    _controller.text = df.format(selectedDate);
    return Card(
        color: AppColors.primaryWhiteColor,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.title,
                style: AppTextStyles.smallBoldTextOnCardStyle(
                    color: AppColors.primaryBlackColor),
              ),
              const SizedBox(height: 16),
              InkWell(
                  onTap: () {
                    _showCalendar(selectedDate);
                  },
                  child: IgnorePointer(
                      child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.datetime,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.borderWhiteColor)),
                        labelText: AppStringsPortuguese.dateLabel,
                        suffixIcon: const Icon(Icons.calendar_today_outlined),
                        labelStyle: TextStyle(color: AppColors.formGreyColor)),
                  ))),
            ])));
  }

  Future<void> _showCalendar(DateTime now) async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime? date = await showDatePicker(
      helpText: 'Selecione a data',
        cancelText: 'Cancelar',
        confirmText: 'Confirmar',
        context: context,
        initialDate: now,
        firstDate: DateTime.now(),
        lastDate: now.add(const Duration(days: 1827)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryGreenColor,
            ),
          ),
          child: child!,
        );
      },
    );
    setState(() {
      selectedDate = date ?? DateTime.now();
      String formattedDate = df.format(selectedDate).toString();
      _controller.text = formattedDate;
      _controller.value = TextEditingValue(text: formattedDate);
      widget.getSelectedDate(formattedDate);
    });
  }
}
