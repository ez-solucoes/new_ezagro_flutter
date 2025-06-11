import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomCardLogoWidget extends StatelessWidget {
  final int index;
  final String labelOne;
  final String textOne;
  final String labelTwo;
  final String textTwo;
  final String labelThree;
  final String textThree;
  final String labelFour;
  final String textFour;
  final IconData? logo;
  final IconData? icon;
  final Function(int) onIconTap;

  const CustomCardLogoWidget(
      {super.key,
      this.index = 0,
      this.labelOne = "",
      this.textOne = "",
      this.labelTwo = "",
      this.textTwo = "",
      this.labelThree = "",
      this.textThree = "",
      this.labelFour = "",
      this.textFour = "",
      this.icon,
      this.logo,
      this.onIconTap = _defaultIconAction});

  @override
  Widget build(BuildContext context) {
    double rowHeight = 31;
    return Card(
      color: AppColors.primaryWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_putLogoIfNeeded()]),
          const SizedBox(width: 15),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: rowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInformationLines(labelOne, textOne),
                    _putIconIfNeeded(rowHeight)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: rowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_buildInformationLines(labelTwo, textTwo)],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: rowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInformationLines(labelThree, textThree),
                    _buildInformationLines(labelFour, textFour)
                  ],
                ),
              )
            ],
          ))
        ]),
      ),
    );
  }

  Row _buildInformationLines(String label, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        label == ""
            ? const SizedBox.shrink()
            : const VerticalDivider(
                width: 1,
                thickness: 1,
                color: AppColors.dividerGreyColor,
              ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:
                  AppTextStyles.labelOnCardStyle(color: AppColors.primaryBlackColor),
            ),
            Text(
              text,
              style: AppTextStyles.smallBoldTextOnCardStyle(
                  color: AppColors.primaryBlackColor),
            )
          ],
        )
      ],
    );
  }

  Widget _putLogoIfNeeded() {
    if (logo != null) {
      return Icon(
        logo,
        size: 60,
      );
    } else {
      return const SizedBox(width: 60);
    }
  }

  Widget _putIconIfNeeded(double rowHeight) {
    if (icon != null) {
      return IconButton(
          constraints: BoxConstraints(maxHeight: rowHeight),
          padding: EdgeInsets.zero,
          onPressed: () {
            onIconTap(index);
          },
          icon: Icon(icon));
    } else {
      return const SizedBox();
    }
  }

  static void _defaultIconAction(int index) {}
}
