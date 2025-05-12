import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';

import '../../../../design_system/typography/app_text_styles.dart';

enum DynamicListType {
  oneColumn,
  twoColumn,
  threeColumn,
}

class CustomDynamicListWidget extends StatelessWidget {
  final DynamicListType type;
  final String listType;
  final String firstTitle;
  final String? secondTitle;
  final String? thirdTitle;

  final bool checkable;
  final List<dynamic> data;
  final Function(int) onItemTap;

  final Function() onEditTap;

  final double maxHeight;

  const CustomDynamicListWidget({
    super.key,
    required this.type,
    required this.firstTitle,
    required this.listType,
    this.secondTitle,
    this.thirdTitle,
    this.checkable = false,
    required this.data,
    required this.onItemTap,
    required this.onEditTap,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DynamicListType.oneColumn:
        return _buildOneColumn(firstTitle);
      case DynamicListType.twoColumn:
        return _buildTwoColumns(firstTitle, secondTitle!);
      case DynamicListType.threeColumn:
        return _buildThreeColumns(firstTitle, secondTitle!);
    }
  }

  Widget _buildOneColumn(String firstTitle) {
    return Container(
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
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  firstTitle,
                  style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('Botão editar');
                    onEditTap();
                  },
                  child: Text(
                    'Editar',
                    style: AppTextStyles.underlinedTextButtonStyle(color: AppColors.primaryBlackColor),
                  ),
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
                  onTap: () => onItemTap(index),
                  child: Container(
                    color: index % 2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: [
                        index == 0 ? Divider(color: AppColors.borderWhiteColor) : SizedBox.shrink(),
                        Expanded(
                          flex: 1,
                          child: Text(
                            data[index],
                            style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                            textAlign: TextAlign.start,
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

  Widget _buildTwoColumns(String first, String second) {
    return Container(
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
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  listType,
                  style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('Botão editar');
                    onEditTap();
                  },
                  child: Text(
                    'Editar',
                    style: AppTextStyles.underlinedTextButtonStyle(color: AppColors.primaryBlackColor),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.borderWhiteColor),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    first,
                    style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                  ),
                ),
                Expanded(
                  child: Text(
                    second,
                    style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                  ),
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
                  onTap: () => onItemTap(index),
                  child: Container(
                    color: index % 2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: [
                        index == 0 ? Divider(color: AppColors.borderWhiteColor) : SizedBox.shrink(),
                        Expanded(
                          flex: 2,
                          child: Text(
                            data[index],
                            style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            data[index],
                            style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                            textAlign: TextAlign.start,
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

  Widget _buildThreeColumns(String first, String second) {
    return Container(
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
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    first,
                    style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                  ),
                ),
                Expanded(
                  child: Text(
                    second,
                    style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                  ),
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
                  onTap: () => onItemTap(index),
                  child: Container(
                    color: index % 2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: [
                        index == 0 ? Divider(color: AppColors.borderWhiteColor) : SizedBox.shrink(),
                        Expanded(
                          flex: 2,
                          child: Text(
                            data[index],
                            style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            data[index],
                            style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                            child: Checkbox(value: false, onChanged: (newValue){}),
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
