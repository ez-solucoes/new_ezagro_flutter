import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/features/domain/entities/selector_entities/selector_entity.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomSelectorWidget extends StatelessWidget {

  final Function(SelectorEntity) onSelect;
  final List<SelectorEntity> items;
  final String title;
  final String selectorHint;
  final SelectorEntity? selectedValue;

  const CustomSelectorWidget({
    super.key,
    required this.onSelect,
    required this.items,
    required this.title,
    required this.selectorHint,
    this.selectedValue
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.primaryWhiteColor,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: items.isEmpty ? AppColors.dividerGreyColor : AppColors.primaryBlackColor),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  value: selectedValue,
                  dropdownColor: AppColors.primaryWhiteColor,
                  style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                  hint: Text(
                    selectorHint,
                    style: AppTextStyles.appBarTitleTextStyle(
                        color: AppColors.formGreyColor),
                  ),
                  items: items.map((SelectorEntity item) {
                    return DropdownMenuItem<SelectorEntity>(
                        value: item, child: Text(item.label ?? ""));
                  }).toList(),
                  onChanged: (value) {
                    if (value is SelectorEntity) { // Cast and null check
                      onSelect(value);
                    }
                  },
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.formGreyColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primaryGreenColor)),
                  )
                ),
              ],
            )));
  }
}
