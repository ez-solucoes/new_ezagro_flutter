import 'package:flutter/material.dart';
import '../../../../consts/app_colors.dart';
import '../../../../consts/app_text_styles.dart';

class CustomCardWithLogoWidget extends StatelessWidget {
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

  const CustomCardWithLogoWidget(
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
    return Card(
      color: AppColors.trueWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: IntrinsicHeight(
            child: Row(
                children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [_putLogoIfNeeded()]),
          const SizedBox(width: 15),
          Expanded(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFirstRow(),
              _buildSecondRow(),
              const SizedBox(height: 10),
              _buildThirdRow(),
            ],
          )
          )
        ])),
      ),
    );
  }

  Row _buildFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
            IntrinsicHeight(child:
                _buildInformationLines(labelOne, textOne)
            ),
        _putIconIfNeeded()
      ],
    );
  }

  Row _buildSecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
            IntrinsicHeight(child:
            _buildInformationLines(labelTwo, textTwo))
      ],
    );
  }

  Row _buildThirdRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
            IntrinsicHeight(child:
            _buildInformationLines(labelThree, textThree)
            ),
            IntrinsicHeight(child: 
              _buildInformationLines(labelFour, textFour)
            )
      ],
    );
  }
  
  Row _buildInformationLines(String label, String text) {
    return Row(
      children: [
        label == "" ? const SizedBox.shrink() : const VerticalDivider(
          width: 1,
          thickness: 1,
          color: AppColors.softGreyColor,
        ),
        const SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.labelOnCardStyle(
                  color: AppColors.blackColor),
            ),
            Text(
              text,
              style: AppTextStyles.smallBoldTextOnCardStyle(
                  color: AppColors.blackColor),
            )
          ],)
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

  Widget _putIconIfNeeded() {
    if (icon != null) {
      return IconButton(
          onPressed: () {
            onIconTap(index);
          },
          icon: Icon(icon));
    } else {
      return const SizedBox();
    }
  }

  static _defaultIconAction(int index) {}
}