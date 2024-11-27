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

  final Function(SelectorEntity)? onSelectSubCategory;
  final List<SelectorEntity>? subItems;
  final String? subSelectorHint;
  final SelectorEntity? selectedSubValue;
  final Function? reloadSubItems;

  const CustomSelectorWidget({
    super.key,
    required this.onSelect,
    required this.items,
    required this.title,
    required this.selectorHint,
    this.selectedValue,
    this.onSelectSubCategory,
    this.subItems,
    this.subSelectorHint,
    this.selectedSubValue,
    this.reloadSubItems
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
                    if (value is SelectorEntity) {
                      onSelect(value);
                      reloadSubItems?.call();
                    }
                  },
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.formGreyColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primaryGreenColor)),
                  )
                ),
                (subItems ?? []).isNotEmpty ? SizedBox(height: 10,) : SizedBox.shrink(),
                _buildSubSelector((subItems ?? []).isNotEmpty)
              ],
            )));
  }

  Widget _buildSubSelector(bool hasItems) {
    return hasItems ?
    DropdownButtonFormField(
        value: selectedSubValue,
        dropdownColor: AppColors.primaryWhiteColor,
        style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
        hint: Text(
          subSelectorHint ?? "",
          style: AppTextStyles.appBarTitleTextStyle(
              color: AppColors.formGreyColor),
        ),
        items: (subItems ?? []).map((SelectorEntity item) {
          return DropdownMenuItem<SelectorEntity>(
              value: item, child: Text(item.label ?? ""));
        }).toList(),
        onChanged: (value) {
          if (value is SelectorEntity) { // Cast and null check
            onSelectSubCategory?.call(value);
          }
        },
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.formGreyColor)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primaryGreenColor)),
        )
    ) : SizedBox.shrink();
  }
}
