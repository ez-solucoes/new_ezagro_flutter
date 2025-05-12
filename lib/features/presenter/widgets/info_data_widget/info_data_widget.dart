import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

import '../../../../design_system/colors/app_colors.dart';

class InfoDataWidget extends StatelessWidget {
  const InfoDataWidget({
    super.key,
    required this.label,
    required this.text,
    required this.isUrgent,
  });

  final String label;
  final dynamic text;
  final bool isUrgent;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const SizedBox(width: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTextStyles.boldTextOnCardStyle(color: AppColors.primaryBlackColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  isUrgent ? Container(
                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRedColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, color: AppColors.primaryWhiteColor, size: 12),
                        Text('Urgente',
                            style: AppTextStyles.labelOnCardStyle(color: AppColors.primaryWhiteColor)),
                      ],
                    ),
                  )
                  : SizedBox(),
                ],
              ),
              label != 'Etapa'
                  ? Text(
                text,
                style: AppTextStyles.bodyTextStyle(color: AppColors.primaryBlackColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
                  : _buildStepContainer(text),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepContainer(String stepName) {

    return Container(
        decoration: BoxDecoration(
          color: _buildStepColor(stepName),
          borderRadius: BorderRadius.circular(15),
          border: stepName == 'Solicitação' ? Border.all(color: AppColors.primaryBlackColor) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            _buildStepText(stepName),
            style: AppTextStyles.bodyTextStyle(color: AppColors.primaryBlackColor),
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
      case 'Cotação' : return 'Em Cotação';
      default: return stepName;
    }
  }
}