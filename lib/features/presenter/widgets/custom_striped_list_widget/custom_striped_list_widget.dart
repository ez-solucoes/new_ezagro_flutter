import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

class CustomStripedListWidget extends StatelessWidget {
  const CustomStripedListWidget(
      {super.key,
      required this.title,
      required this.data,
      required this.maxHeight,
      required this.onTap,
      this.equalColumnProportions = false});

  final String title;
  final List<String> data;
  final double maxHeight;
  final bool equalColumnProportions;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? SizedBox.shrink()
        : Container(
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
            child: Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.only(top:10, right: 10, left: 10),
                  child: Row(
                    children: [
                      Text(
                        title,
                        style:
                            AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                        textAlign: equalColumnProportions ? TextAlign.center : TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Divider(color: AppColors.borderWhiteColor),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => onTap(index),
                        child: Container(
                          color: index % 2 == 0
                              ? AppColors.primaryWhiteColor
                              : AppColors.softGreenColor,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(children: [
                              index == 0
                                  ? Divider(color: AppColors.borderWhiteColor)
                                  : SizedBox.shrink(),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  data[index],
                                  style: AppTextStyles.cardBodyTextStyle(
                                      color: AppColors.primaryBlackColor),
                                  textAlign: equalColumnProportions
                                      ? TextAlign.center
                                      : TextAlign.start,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      );
                    })
              ],
            ),
          );
  }
}
