import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_colors.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';
import 'package:new_ezagro_flutter/core/enums/service_order_type_enum.dart';

class ServiceOrderCardWidget extends StatelessWidget {
  final int id;
  final String serviceOrderType;
  final String farm;
  final String costCenter;
  final String openingDate;
  final String closingDate;
  final ServiceOrderTypeEnum status;

  const ServiceOrderCardWidget({
    super.key,
    required this.id,
    required this.serviceOrderType,
    required this.farm,
    required this.costCenter,
    required this.openingDate,
    required this.closingDate,
    required this.status,
  });

  Color _getBackgroundColor() {
    switch(status) {
      case ServiceOrderTypeEnum.finished:
        return AppColors.greenColor;
      default:
        return AppColors.trueWhiteColor;

    }
  }

  Color _getTextColor() {
    switch(status) {
      case ServiceOrderTypeEnum.finished:
        return AppColors.trueWhiteColor;
      default:
        return AppColors.blackColor;
    }
  }

  Color _getBorderColor() {
    switch (status) {
      case ServiceOrderTypeEnum.toBeStarted:
        return AppColors.contourWhiteColor;
      case ServiceOrderTypeEnum.onGoing:
        return AppColors.greenColor;
      case ServiceOrderTypeEnum.paused:
        return AppColors.darkGreyColor;
      case ServiceOrderTypeEnum.finished:
        return AppColors.contourWhiteColor;
      case ServiceOrderTypeEnum.approvalPending:
        return AppColors.muddyYellowColor;
      case ServiceOrderTypeEnum.canceled:
        return AppColors.redCanceledColor;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(7.0)),
      child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(
              color: _getBorderColor(),
              width: 1.5,
            ),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$id - $serviceOrderType",
                    style:
                        AppTextStyles.bigBoldCardTitle(color: _getTextColor())),
                const SizedBox(height: 15),
                Text(farm,
                    style: AppTextStyles.cardBodyTextStyle(
                        color: _getTextColor())),
                Text(AppStrings.costCenterCardField + costCenter,
                    style: AppTextStyles.cardBodyTextStyle(
                        color: _getTextColor())),
                Text(AppStrings.openingDateCardField + openingDate,
                    style: AppTextStyles.cardBodyTextStyle(
                        color: _getTextColor())),
                closingDate.isEmpty ? const SizedBox() : Text(AppStrings.closingDateCardField + closingDate,
                    style:
                        AppTextStyles.cardBodyTextStyle(color: _getTextColor()))
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                        ServiceOrderTypeEnumExtension.enumServiceOrderTypeToString(status),
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cardBodyTextStyle(
                            color: _getTextColor())),
                    const SizedBox(width: 8.0),
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

