import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/stacked_data_widget/stacked_data_widget.dart';
import '../../../../design_system/colors/app_colors.dart';

class ThreeInfoCard extends StatelessWidget {
  const ThreeInfoCard({
    super.key,
    required this.title,
    required this.info1,
    required this.info2,
    required this.info3,
  });

  final String title;
  final (String label, String text) info1;
  final (String label, String text) info2;
  final (String label, String text) info3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StackedDataWidget(label: info1.$1, text: info1.$2),
                    StackedDataWidget(label: info2.$1, text: info2.$2),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: StackedDataWidget(label: info3.$1, text: info3.$2)),
            ],
          ),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }
}