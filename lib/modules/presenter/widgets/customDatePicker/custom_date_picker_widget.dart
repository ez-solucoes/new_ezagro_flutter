import 'package:flutter/material.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_strings.dart';
import '../../../../consts/app_text_styles.dart';
import 'package:intl/intl.dart';

class CustomDatePickerWidget extends StatefulWidget {
  final String title;

  const CustomDatePickerWidget({super.key, required this.title});

  @override
  State<CustomDatePickerWidget> createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.trueWhiteColor,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.title,
                style: AppTextStyles.smallBoldTextOnCardStyle(
                    color: AppColors.blackColor),
              ),
              const SizedBox(height: 16),
              InkWell(
                  onTap: () {
                    _showCalendar(selectedDate);
                  },
                  child: IgnorePointer(
                      child: TextFormField(
                    initialValue: DateFormat("dd/MM/yyyy").format(selectedDate),
                    keyboardType: TextInputType.datetime,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.contourWhiteColor)),
                        labelText: AppStrings.dateLabel,
                        suffixIcon: Icon(Icons.calendar_today_outlined),
                        labelStyle: TextStyle(color: AppColors.greyColor)),
                  ))),
            ])));
  }

  _showCalendar(DateTime now) async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime? date = await showDatePicker(
            context: context,
            initialDate: now,
            firstDate: DateTime(2023),
            lastDate: now.add(const Duration(days: 1827)));
    setState(() {
      selectedDate = date ?? DateTime.now();
    });
  }
}
