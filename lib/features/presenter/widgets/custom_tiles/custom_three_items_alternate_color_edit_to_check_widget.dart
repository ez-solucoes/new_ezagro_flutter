import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

typedef SelectableItemCallback = void Function(bool isSelected);
class CustomThreeItemsAlternateColorEditToCheckWidget extends StatefulWidget {
  final String firstLabel;
  final String secondLabel;
  final String thirdLabel;
  final bool initialIsSelected;
  final SelectableItemCallback onChanged;

  const CustomThreeItemsAlternateColorEditToCheckWidget({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.thirdLabel,
    required this.initialIsSelected,
    required this.onChanged,
  });

  @override
  State<CustomThreeItemsAlternateColorEditToCheckWidget> createState() => _CustomThreeItemsAlternateColorEditToCheckWidgetState();
}

class _CustomThreeItemsAlternateColorEditToCheckWidgetState extends State<CustomThreeItemsAlternateColorEditToCheckWidget> {
  late bool _isChecked;

  @override
  void initState() {
    _isChecked = widget.initialIsSelected;
    super.initState();
  }

  @override
  void didUpdateWidget(
      covariant CustomThreeItemsAlternateColorEditToCheckWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIsSelected != oldWidget.initialIsSelected) {
      _isChecked = widget.initialIsSelected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChanged(_isChecked);
      },
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Checkbox(
                value: _isChecked,
                onChanged: (bool? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _isChecked = newValue;
                    });
                    widget.onChanged(newValue);
                  }
                },
                activeColor: AppColors.primaryGreenColor,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.firstLabel,
              style: AppTextStyles.boldTextOnCardStyle(
                  color: AppColors.primaryBlackColor),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.secondLabel,
              style: AppTextStyles.boldTextOnCardStyle(
                  color: AppColors.primaryBlackColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.thirdLabel,
              style: AppTextStyles.boldTextOnCardStyle(
                  color: AppColors.primaryBlackColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
