import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

class CustomStripedTable extends StatelessWidget {
  const CustomStripedTable({
    super.key,
    required this.columnNames,
    required this.data,
    required this.maxHeight
  });

  final List<String> columnNames;
  final List<List<String>> data;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteColor,
        border: Border.all(width: 3,color: AppColors.borderWhiteColor),
        borderRadius: BorderRadius.circular(4),
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
                    flex: 1,
                    child: Text(columnNames[0],
                        style: AppTextStyles.smallBoldTextStyle(
                            color: AppColors.primaryBlackColor)),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(columnNames[1],
                        style: AppTextStyles.smallBoldTextStyle(
                            color: AppColors.primaryBlackColor)),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(columnNames[2],
                        style: AppTextStyles.smallBoldTextStyle(
                            color: AppColors.primaryBlackColor),
                      textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
            Divider(color: AppColors.borderWhiteColor),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: index%2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                            children: [
                              index == 0 ? Divider(color: AppColors.borderWhiteColor) : SizedBox.shrink(),
                          Expanded(
                            flex: 1,
                            child: Text(data[index][0],
                                style: AppTextStyles.appBarSubTitleTextStyle(
                                    color: AppColors.primaryBlackColor),
                                textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(data[index][1],
                                style: AppTextStyles.appBarSubTitleTextStyle(
                                    color: AppColors.primaryBlackColor),
                                textAlign: TextAlign.start,),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(data[index][2],
                                style: AppTextStyles.appBarSubTitleTextStyle(
                                    color: AppColors.primaryBlackColor),
                                textAlign: TextAlign.center,),
                          ),
                        ]),
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


