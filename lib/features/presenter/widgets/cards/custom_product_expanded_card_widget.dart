import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../miscellaneous/item_selection_controller.dart';
import '../buttons/custom_outlined_icon_button.dart';

class CustomProductExpandedCardWidget extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> firstColumnData;
  final List<Map<String, dynamic>> secondColumnData;
  final ItemType itemType;
  final bool canBeRemoved;
  final VoidCallback onRemove;
  final VoidCallback? onEdit;


  const CustomProductExpandedCardWidget({
    super.key,
    required this.index,
    required this.firstColumnData,
    required this.secondColumnData,
    required this.itemType,
    required this.onRemove,
    required this.canBeRemoved,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = index % 2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: firstColumnData.map((data) => _buildRowItem(data)).toList(),
                ),
              ),
              SizedBox(width: 16.0),


              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: secondColumnData.map((data) => _buildRowItem(data)).toList(),
                ),
              ),
            ],
          ),
          canBeRemoved
          ? Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: itemType == ItemType.company ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
              children: [
                Expanded(

                  flex: itemType == ItemType.company && onEdit == null ? 0 : 1,
                  child: CustomOutlinedIconButton(
                    onPressed: onRemove,
                    label: 'Remover',
                    textColor: AppColors.primaryBlackColor,
                    backgroundColor: AppColors.primaryWhiteColor,
                    borderColor: AppColors.formGreyColor,
                    icon: Icons.delete_outline_outlined,
                    iconColor: AppColors.primaryBlackColor,
                  ),
                ),


                if (itemType == ItemType.product || (itemType == ItemType.company && onEdit != null))
                  const SizedBox(width: 30),


                if (itemType == ItemType.product || (itemType == ItemType.company && onEdit != null))
                  Expanded(
                    child: CustomOutlinedIconButton(
                      onPressed: onEdit ?? () {}, // Usa o callback onEdit (ou uma função vazia se null)
                      label: 'Editar',
                      textColor: AppColors.primaryBlackColor,
                      backgroundColor: AppColors.primaryWhiteColor,
                      borderColor: AppColors.formGreyColor,
                      icon: Icons.edit_outlined,
                      iconColor: AppColors.primaryBlackColor,
                    ),
                  ),
              ],
            ),
          )
          : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildRowItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['title'] as String,
            style: AppTextStyles.boldTextOnCardStyle(color: AppColors.primaryBlackColor),
          ),
          Text(
            '${item['conteudo']}',
            style: AppTextStyles.labelOnCardStyle(color: AppColors.primaryBlackColor),
          ),
        ],
      ),
    );
  }
}
