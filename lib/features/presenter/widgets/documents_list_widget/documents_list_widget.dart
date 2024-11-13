import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

class DocumentsListWidget extends StatelessWidget {
  const DocumentsListWidget({
    super.key,
    required this.title,
    required this.data,
    required this.maxHeight,
    required this.action,
  });

  final String title;
  final List<String> data;
  final double maxHeight;
  final Function action;

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
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      title,
                      style: AppTextStyles.smallBoldTextStyle(
                          color: AppColors.primaryBlackColor),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.borderWhiteColor),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: index % 2 == 0
                          ? AppColors.primaryWhiteColor
                          : AppColors.softGreenColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                data[index],
                                style: AppTextStyles.appBarSubTitleTextStyle(
                                    color: AppColors.primaryBlackColor),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            IconButton(
                              onPressed: () => action(),
                              icon: const Icon(Icons.remove_red_eye_outlined),
                            ),
                          ],
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