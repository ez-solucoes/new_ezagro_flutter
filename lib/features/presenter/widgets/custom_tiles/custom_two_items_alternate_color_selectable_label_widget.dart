import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

typedef SelectableItemCallback = void Function(bool isSelected);

class CustomTwoItemsAlternateColorSelectableLabelWidget extends StatefulWidget {
  final String firstLabel;
  final String secondLabel;
  final bool initialIsSelected;
  final SelectableItemCallback onChanged;


  const CustomTwoItemsAlternateColorSelectableLabelWidget({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.initialIsSelected,
    required this.onChanged,
  });

  @override
  State<CustomTwoItemsAlternateColorSelectableLabelWidget> createState() => _CustomTwoItemsAlternateColorSelectableLabelWidgetState();
}

class _CustomTwoItemsAlternateColorSelectableLabelWidgetState extends State<CustomTwoItemsAlternateColorSelectableLabelWidget> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialIsSelected;
  }



  @override
  void didUpdateWidget(covariant CustomTwoItemsAlternateColorSelectableLabelWidget oldWidget) {
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
              style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              widget.secondLabel,
              style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Checkbox(
                value: _isChecked,
                onChanged: (newValue) {
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

        ],
      ),
    );
  }
}
