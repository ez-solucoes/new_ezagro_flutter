import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomStripedTableDisproportionateWidget extends StatelessWidget {
  const CustomStripedTableDisproportionateWidget({
    super.key,
    required this.columnNames,
    required this.data,
    required this.maxHeight,
    required this.onTap,
    this.equalColumnProportions = false
  });

  final List<String> columnNames;
  final List<List<String>> data;
  final double maxHeight;
  final bool equalColumnProportions;
  final Function(int) onTap;

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
                    return GestureDetector(
                      onTap: () => onTap(index),
                      child: Container(
                        color: index%2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              children: [
                                index == 0 ? Divider(color: AppColors.borderWhiteColor) : SizedBox.shrink(),
                                Expanded(
                                  flex: 1,
                                  child: Text(data[index][0],
                                    style: AppTextStyles.appBarSubTitleTextStyle(
                                        color: AppColors.primaryBlackColor),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Text(data[index][1],
                                  style: AppTextStyles.appBarSubTitleTextStyle(
                                      color: AppColors.primaryBlackColor),
                                  textAlign:TextAlign.center),
                                SizedBox(width: 30),
                                Text(data[index][2],
                                  style: AppTextStyles.appBarSubTitleTextStyle(
                                      color: AppColors.primaryBlackColor),
                                  textAlign: TextAlign.center,),
                                SizedBox(width: 20),
                              ]),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
