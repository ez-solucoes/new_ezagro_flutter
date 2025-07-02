import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

typedef SelectableItemCallback = void Function(bool isSelected);

class CustomTwoItemsAlternateColorSelectableTileWidget extends StatefulWidget {
  final String firstLabel;
  final String secondLabel;
  final bool initialIsSelected;
  final SelectableItemCallback onChanged;

  const CustomTwoItemsAlternateColorSelectableTileWidget({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.initialIsSelected,
    required this.onChanged,
  });

  @override
  State<CustomTwoItemsAlternateColorSelectableTileWidget> createState() => _CustomTwoItemsAlternateColorSelectableTileWidgetState();
}

class _CustomTwoItemsAlternateColorSelectableTileWidgetState extends State<CustomTwoItemsAlternateColorSelectableTileWidget> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialIsSelected;
  }


  @override
  void didUpdateWidget(covariant CustomTwoItemsAlternateColorSelectableTileWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIsSelected != oldWidget.initialIsSelected) {
      _isChecked = widget.initialIsSelected;
    }
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              widget.firstLabel,
              style:AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),

            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              widget.secondLabel,
              style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
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
          )
        ],
      ),
    );
  }
}
