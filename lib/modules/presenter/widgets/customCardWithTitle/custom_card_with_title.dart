import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/consts/app_text_styles.dart';
import 'package:new_ezagro_flutter/core/enums/service_order_type_enum.dart';

class CustomCardWithTitleWidget extends StatelessWidget {
  final int id;
  final String serviceOrderType;
  final String farm;
  final String costCenter;
  final String openingDate;
  final String closingDate;
  final ServiceOrderTypeEnum status;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const CustomCardWithTitleWidget({
    super.key,
    required this.id,
    required this.serviceOrderType,
    required this.farm,
    required this.costCenter,
    required this.openingDate,
    required this.closingDate,
    required this.status,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(7.0)),
      child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(
              color: borderColor,
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
                        AppTextStyles.bigBoldCardTitle(color: textColor)),
                const SizedBox(height: 15),
                Text(farm,
                    style: AppTextStyles.cardBodyTextStyle(
                        color: textColor)),
                Text(AppStrings.costCenterCardField + costCenter,
                    style: AppTextStyles.cardBodyTextStyle(
                        color: textColor)),
                Text(AppStrings.openingDateCardField + openingDate,
                    style: AppTextStyles.cardBodyTextStyle(
                        color: textColor)),
                closingDate.isEmpty ? const SizedBox() : Text(AppStrings.closingDateCardField + closingDate,
                    style:
                        AppTextStyles.cardBodyTextStyle(color: textColor))
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
                            color: textColor)),
                    const SizedBox(width: 8.0),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                      color: textColor,
                    ),
                  ],
                )
              ],
            )
          ])),
    );
  }
}

