import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/stacked_data_widget/stacked_data_widget.dart';
import '../../../../design_system/colors/app_colors.dart';

class MultInfoCard extends StatelessWidget {
  const MultInfoCard({
    super.key,
    required this.title,
    required this.columnOneData,
    required this.columnTwoData,
  });

  final String title;
  final List<(String label, String text)> columnOneData;
  final List<(String label, String text)> columnTwoData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              title,
              style: AppTextStyles.boldMediumTextStyle(
                  color: AppColors.primaryBlackColor),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: const Divider(
              height: 1,
              color: AppColors.borderWhiteColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coluna 1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnOneData.map((data) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7.5),
                    child: StackedDataWidget(
                      label: data.$1,
                      text: data.$2,
                    ),
                  );
                }).toList(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnTwoData.map((data) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7.5),
                    child: StackedDataWidget(
                      label: data.$1,
                      text: data.$2,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 7.5,)
        ],
      ),
    );
  }
}