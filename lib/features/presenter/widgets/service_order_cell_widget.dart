import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_colors.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';

class ServiceOrderCellWidget extends StatelessWidget {
  final String id;
  final String serviceOrderType;
  final String farm;
  final String costCenter;
  final String openingDate;
  final String closingDate;
  final String status;

  ServiceOrderCellWidget({
    required this.id,
    required this.serviceOrderType,
    required this.farm,
    required this.costCenter,
    required this.openingDate,
    required this.closingDate,
    required this.status,
  });

  Color _getBackgroundColor() {
    switch (status.toLowerCase()) {
      case 'concluído':
        return AppColors.greenColor;
      default:
        return AppColors.trueWhiteColor;
    }
  }

  Color _getTextColor() {
    switch (status.toLowerCase()) {
      case 'concluído':
        return AppColors.trueWhiteColor;
      default:
        return AppColors.blackColor;
    }
  }

  Color _getBorderColor() {
    switch (status.toLowerCase()) {
      case 'concluído':
        return AppColors.trueWhiteColor;
      case 'aguard. aprovação':
        return AppColors.muddyYellowColor;
      case 'pausada':
        return AppColors.darkGreyColor;
      case 'em andamento':
        return AppColors.greenColor;
      case 'cancelada':
        return AppColors.redCanceledColor;
      case 'a iniciar':
        return AppColors.whiteBorderColor;
      default:
        return AppColors.blackColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(7.0)),
      child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(
              color: _getBorderColor(), // Cor da borda
              width: 1.5, // Largura da borda
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(id + " - " + serviceOrderType,
                    style:
                        AppTextStyles.bigBoldCellTitle(color: _getTextColor())),
                SizedBox(height: 15),
                Text(farm,
                    style: AppTextStyles.cellBodyTextStyle(
                        color: _getTextColor())),
                Text(AppStrings.costCenterCellField + costCenter,
                    style: AppTextStyles.cellBodyTextStyle(
                        color: _getTextColor())),
                Text(AppStrings.openingDateCellField + openingDate,
                    style: AppTextStyles.cellBodyTextStyle(
                        color: _getTextColor())),
                closingDate.isEmpty ? SizedBox() : Text(AppStrings.closingDateCellField + closingDate,
                    style:
                        AppTextStyles.cellBodyTextStyle(color: _getTextColor()))
              ],
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Text(status,
                        style: AppTextStyles.cellBodyTextStyle(
                            color: _getTextColor())),
                    SizedBox(width: 8.0),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                      color: _getTextColor(),
                    ),
                  ],
                )
              ],
            )
          ])),
    );
  }
}
