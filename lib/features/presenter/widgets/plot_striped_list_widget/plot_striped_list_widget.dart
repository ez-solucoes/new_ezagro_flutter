import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_status_label/custom_status_label.dart';

import '../../../domain/entities/plot_entities/plot_entity.dart';

class PlotStripedListWidget extends StatelessWidget {
  const PlotStripedListWidget({
    super.key,
    required this.columnTitles,
    required this.plots,
    required this.maxHeight,
  });

  final List<String> columnTitles;
  final List<PlotEntity> plots;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteColor,
        border: Border.all(width: 3, color: AppColors.borderWhiteColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(12),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: columnTitles.asMap().entries.map((entry) {
                  final index = entry.key;
                  final title = entry.value;
                  return Expanded(
                    flex: index == 0 ? 1 : 3,
                    child: Text(
                      title,
                      style: AppTextStyles.smallBoldTextStyle(
                          color: AppColors.primaryBlackColor),
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(color: AppColors.borderWhiteColor),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: plots.length,
                itemBuilder: (context, index) {
                  final plot = plots[index];
                  return Container(
                    color: index % 2 == 0
                        ? AppColors.primaryWhiteColor
                        : AppColors.softGreenColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              plot.id.toString(),
                              style: AppTextStyles.appBarSubTitleTextStyle(
                                  color: AppColors.primaryBlackColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              plot.area.toString(),
                              style: AppTextStyles.appBarSubTitleTextStyle(
                                  color: AppColors.primaryBlackColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              plot.plotGroup?.name ?? "Nome" ,
                              style: AppTextStyles.appBarSubTitleTextStyle(
                                  color: AppColors.primaryBlackColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: CustomStatusLabel(style: LabelStyle.values[index%6], text: "Concluído"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}