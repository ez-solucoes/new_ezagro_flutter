import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class StepBoxWidget extends StatelessWidget {
  final String step;

  const StepBoxWidget({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: _buildStepColor(step),
          borderRadius: BorderRadius.circular(15),
          border: step == 'Solicitação' ? Border.all(color: AppColors.primaryBlackColor) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            _buildStepText(step),
            textAlign: TextAlign.center,
            style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        )
    );
  }

  Color _buildStepColor(String stepName) {
    switch (stepName) {
      case 'Pedido de Compra' : return AppColors.primaryGreenColor;
      case 'Cotação' : return AppColors.primaryBlueColor;
      case 'Solicitação' : return AppColors.transparent;
      default: return AppColors.primaryRedColor;
    }
  }

  String _buildStepText(String stepName) {
    switch (stepName) {
      case 'Pedido de Compra' : return 'Compra';
      case 'Cotação' : return 'Cotação';
      case 'Solicitação' : return 'Aprovação';
      default: return stepName;
    }
  }
}
