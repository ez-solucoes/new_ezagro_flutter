import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/stacked_data_widget/stacked_data_widget.dart';
import '../../../../design_system/colors/app_colors.dart';

class MultInfoCard extends StatelessWidget {
  const MultInfoCard({
    super.key,
    required this.title,
    required this.sectionsData,
  });

  final String title;
  final List<(List<(String label, String text)>, List<(String label, String text)>)> sectionsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
          ...sectionsData.map((sectionData) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sectionData.$1.map((data) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 2.5),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: StackedDataWidget(
                              label: data.$1,
                              text: data.$2,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sectionData.$2.map((data) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7.5),
                          child: StackedDataWidget(
                            label: data.$1,
                            text: data.$2,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                if (sectionsData.indexOf(sectionData) < sectionsData.length - 1)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: const Divider(
                      height: 1,
                      color: AppColors.borderWhiteColor,
                    ),
                  ),
              ],
            );
          }),
          const SizedBox(height: 7.5,)
        ],
      ),
    );
  }
}