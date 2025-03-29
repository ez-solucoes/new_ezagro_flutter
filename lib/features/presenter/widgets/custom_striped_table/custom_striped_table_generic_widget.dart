import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomStripedTableGenericWidget extends StatelessWidget {
  final List<String> columnNames;
  final List<List<String>> data;
  final double maxHeight;
  final bool equalColumnProportions;
  final Function(int)? onTap;
  final Widget child;

  const CustomStripedTableGenericWidget({
    super.key,
    required this.columnNames,
    required this.data,
    required this.maxHeight,
    this.onTap,
    this.equalColumnProportions = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return data.isEmpty ? SizedBox.shrink() : Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(columnNames[0],
                      style: AppTextStyles.smallBoldTextStyle(
                          color: AppColors.primaryBlackColor),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(columnNames[1],
                    style: AppTextStyles.smallBoldTextStyle(
                        color: AppColors.primaryBlackColor),
                    textAlign: equalColumnProportions ? TextAlign.center : TextAlign.start,
                  ),
                  SizedBox(width: 40),
                ],
              ),
            ),
            Divider(color: AppColors.borderWhiteColor),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return child;
                  }),
            )
          ],
        ),
      ),
    );
  }
}
