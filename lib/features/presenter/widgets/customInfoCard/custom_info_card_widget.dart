import 'package:flutter/material.dart';
import '../../../../consts/app_colors.dart';
import '../../../../consts/app_text_styles.dart';

enum InfoCardType {
  activityType,
  oneLabeledInfo,
  twoLabeledInfo,
  threeLabeledInfo,
  threeLabeledInfoWithIcon
}

class CustomInfoCardWidget extends StatelessWidget {
  final InfoCardType infoCardType;

  final int index;
  final String labelOne;
  final String textOne;
  final String labelTwo;
  final String textTwo;
  final String labelThree;
  final String textThree;
  final IconData? icon;
  final Function(int) onIconTap;

  const CustomInfoCardWidget({
    super.key,
    this.index = 0,
    this.labelOne = "",
    this.textOne = "",
    this.labelTwo = "",
    this.textTwo = "",
    this.labelThree = "",
    this.textThree = "",
    this.icon,
    this.onIconTap = _defaultIconAction,
    required this.infoCardType,
  });

  @override
  Widget build(BuildContext context) {
    switch (infoCardType) {
      case InfoCardType.activityType:
        return _buildActivityCard;
      case InfoCardType.oneLabeledInfo:
        return _buildOneLabeledInfo;
      case InfoCardType.twoLabeledInfo:
        return _buildTwoLabeledInfo;
      case InfoCardType.threeLabeledInfo:
        return _buildThreeLabeledInfo;
      case InfoCardType.threeLabeledInfoWithIcon:
        return _buildThreeLabeledInfoWithCard;
    }
  }

  Container get _buildActivityCard => Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelOne,
                style:
                    AppTextStyles.labelOnCardStyle(color: AppColors.blackColor),
              ),
              Text(
                textOne,
                style: AppTextStyles.boldTextOnCardStyle(
                    color: AppColors.blackColor),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                labelTwo,
                style:
                    AppTextStyles.labelOnCardStyle(color: AppColors.blackColor),
              ),
              Text(
                textTwo,
                style: AppTextStyles.smallBoldTextOnCardStyle(
                    color: AppColors.blackColor),
              )
            ],
          )
        ],
      ));

  Container get _buildOneLabeledInfo => Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelOne,
                style:
                    AppTextStyles.labelOnCardStyle(color: AppColors.blackColor),
              ),
              Text(
                textOne,
                style: AppTextStyles.boldTextOnCardStyle(
                    color: AppColors.blackColor),
              ),
            ],
          ),
          Column(
            children: [_putIconIfNeeded()],
          )
        ],
      ));

  Container get _buildTwoLabeledInfo => Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelOne,
                style:
                    AppTextStyles.labelOnCardStyle(color: AppColors.blackColor),
              ),
              Text(
                textOne,
                style: AppTextStyles.boldTextOnCardStyle(
                    color: AppColors.blackColor),
              )
            ],
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: AppColors.softGreyColor,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      labelTwo,
                      style: AppTextStyles.labelOnCardStyle(
                          color: AppColors.blackColor),
                    ),
                    Text(
                      textTwo,
                      style: AppTextStyles.boldTextOnCardStyle(
                          color: AppColors.blackColor),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ));

  Container get _buildThreeLabeledInfo => Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  labelOne,
                  style: AppTextStyles.labelOnCardStyle(
                      color: AppColors.blackColor),
                ),
                Text(
                  textOne,
                  style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor),
                )
              ],
            ),
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: AppColors.softGreyColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  labelTwo,
                  style: AppTextStyles.labelOnCardStyle(
                      color: AppColors.blackColor),
                ),
                Text(
                  textTwo,
                  style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor),
                )
              ],
            ),
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: AppColors.softGreyColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  labelThree,
                  style: AppTextStyles.labelOnCardStyle(
                      color: AppColors.blackColor),
                ),
                Text(
                  textThree,
                  style: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor),
                )
              ],
            )
          ],
        ),
      ));

  Card get _buildThreeLabeledInfoWithCard => Card(
      color: AppColors.trueWhiteColor,
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IntrinsicHeight(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          labelOne,
                          style: AppTextStyles.labelOnCardStyle(
                              color: AppColors.blackColor),
                        ),
                        Text(
                          textOne,
                          style: AppTextStyles.boldMediumTextStyle(
                              color: AppColors.blackColor),
                        )
                      ]),
                  Column(children: [_putIconIfNeeded()]),
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  labelTwo,
                  style: AppTextStyles.labelOnCardStyle(
                      color: AppColors.blackColor),
                ),
                Text(
                  textTwo,
                  style: AppTextStyles.boldMediumTextStyle(
                      color: AppColors.blackColor),
                )
              ]),
              const SizedBox(width: 30),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                IntrinsicHeight(
                    child: Row(children: [
                  const VerticalDivider(
                    width: 2,
                    thickness: 1,
                    color: AppColors.softGreyColor,
                  ),
                  const SizedBox(width: 5),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          labelThree,
                          style: AppTextStyles.labelOnCardStyle(
                              color: AppColors.blackColor),
                        ),
                        Text(
                          textThree,
                          style: AppTextStyles.boldMediumTextStyle(
                              color: AppColors.blackColor),
                        )
                      ])
                ]))
              ]),
            ]),
          ]))));

  Widget _putIconIfNeeded() {
    if (icon != null) {
      return IconButton(onPressed: () {onIconTap(index);}, icon: Icon(icon));
    } else {
      return const SizedBox();
    }
  }

  static _defaultIconAction(int index) {}
}
