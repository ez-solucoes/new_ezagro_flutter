import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';

class CustomLoadingIndicatorWidget extends StatelessWidget {
  const CustomLoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primaryBlackColor.withValues(alpha: 0.5),
        ),
        Center(child: CircularProgressIndicator(color: AppColors.primaryBlackColor,)),
      ],
    );
  }
}
