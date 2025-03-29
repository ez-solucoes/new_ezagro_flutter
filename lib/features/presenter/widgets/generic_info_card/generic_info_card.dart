import 'package:flutter/material.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../info_data_widget/info_data_widget.dart';

class GenericInfoCard extends StatelessWidget {
  const GenericInfoCard({
    super.key,
    required this.sectionsData,
  });

  final List<(List<(String label, String text)>, List<(String label, String text)>)> sectionsData;

  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ...sectionsData.map((sectionData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sectionData.$1.map((data) {
                        return Padding(
                          padding: EdgeInsets.only(top:10),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: InfoDataWidget(
                              label: data.$1,
                              text: data.$2,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sectionData.$2.map((data) {
                        return Padding(
                          padding: EdgeInsets.only(top:10),
                          child: InfoDataWidget(
                            label: data.$1,
                            text: data.$2,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}