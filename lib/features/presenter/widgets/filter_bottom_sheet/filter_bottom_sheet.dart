import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../buttons/custom_elevated_button.dart';
import '../buttons/custom_outlined_button.dart';

class FilterBottomSheet extends StatelessWidget {
  final List<(String, bool)> filterOptions;
  final Function(bool, int) onCheckBoxTap;
  final Function onApply;
  final Function onCleanFilters;

  const FilterBottomSheet({
    super.key,
    required this.filterOptions,
    required this.onApply,
    required this.onCleanFilters,
    required this.onCheckBoxTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(Icons.filter_alt_outlined),
                const SizedBox(width: 8),
                Text(
                  'Filtrar por',
                  style: AppTextStyles.appBarTitleTextStyle(
                    color: AppColors.primaryBlackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SizedBox(
                width: 160,
                child: ListView.builder(
                  itemCount: filterOptions.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.platform,
                      title: Text(
                          filterOptions[index].$1,
                          style: AppTextStyles.labelTextFieldStyle(color: AppColors.primaryBlackColor),
                          textAlign: TextAlign.end,
                      ),
                      value: filterOptions[index].$2,
                      onChanged: (value) {
                        onCheckBoxTap(value ?? false, index);
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomOutlinedButton(
                  label: AppStringsPortuguese.cleanFilterButton,
                  textStyle: AppTextStyles.labelTextButtonStyle(color: AppColors.primaryBlackColor),
                  customColor: AppColors.primaryBlackColor,
                  onPressed: () {
                    onCleanFilters();
                  },
                ),
                const SizedBox(width: 16),
                CustomElevatedButton(
                  label: AppStringsPortuguese.applyFilterButton,
                  onPressed: () {
                    onApply();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}