import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_widget.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../../domain/entities/select_entities/select_entity.dart';

class CustomAutocompleteCardWidget extends StatelessWidget {
  final String title;
  final List<SelectEntity> itemList;
  final ValueChanged<SelectEntity> onItemSelected;
  final String hintText;
  final AutoCompleteType autoCompleteType;
  final SelectEntity? initialValue;

  const CustomAutocompleteCardWidget({
    super.key,
    required this.title,
    required this.itemList,
    required this.onItemSelected,
    this.hintText = 'Pesquisar',
    required this.autoCompleteType,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
            ),
            SizedBox(height: 10),
            CustomAutocompleteWidget(
              itemList: itemList,
              onItemSelected: onItemSelected,
              autoCompleteType: autoCompleteType,
              hintText: hintText,
              initialValue: initialValue,
            )
          ],
        ),
      ),
    );
  }
}
