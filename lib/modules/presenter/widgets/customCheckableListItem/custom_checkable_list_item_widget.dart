import 'package:flutter/material.dart';
import '../../../../consts/app_colors.dart';
import '../../../../consts/app_text_styles.dart';

class CustomCheckableListItemWidget extends StatefulWidget {
  bool indexIsChecked;
  final bool isHeader;
  final String firstColumn;
  final String secondColumn;
  final String thirdColumn;
  final int index;
  final Function(int) onCheckBoxTap;

  CustomCheckableListItemWidget(
      {super.key,
      this.isHeader = false,
      this.indexIsChecked = false,
      required this.firstColumn,
      required this.secondColumn,
      required this.thirdColumn,
      required this.index,
      required this.onCheckBoxTap});

  @override
  _CustomCheckableListItemWidgetState createState() =>
      _CustomCheckableListItemWidgetState();
}

class _CustomCheckableListItemWidgetState
    extends State<CustomCheckableListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
            color: widget.index % 2 == 0
                ? AppColors.trueWhiteColor
                : AppColors.softGreenColor,
            border: const Border(
                bottom:
                    BorderSide(color: AppColors.contourWhiteColor, width: 2.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(children: [
              Checkbox(
                  value: widget.isHeader? true : widget.indexIsChecked,
                  activeColor: AppColors.greenColor,
                  onChanged: (bool? value) {
                    setState(() {
                      if (widget.isHeader) {
                        return;
                      }
                      widget.indexIsChecked = value!;
                    });
                  })
            ]),
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.firstColumn,
                      style: widget.isHeader
                          ? AppTextStyles.smallBoldTextOnCardStyle(
                              color: AppColors.blackColor)
                          : AppTextStyles.cardBodyTextStyle(
                              color: AppColors.blackColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.secondColumn,
                      style: widget.isHeader
                          ? AppTextStyles.smallBoldTextOnCardStyle(
                          color: AppColors.blackColor)
                          : AppTextStyles.cardBodyTextStyle(
                          color: AppColors.blackColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.thirdColumn,
                      style: widget.isHeader
                          ? AppTextStyles.smallBoldTextOnCardStyle(
                          color: AppColors.blackColor)
                          : AppTextStyles.cardBodyTextStyle(
                          color: AppColors.blackColor),
                      textAlign: TextAlign.center,
                    )
                  ].map((e) => Expanded(child: e)).toList(),
                )
              ],
            ))
          ],
        ),
      ),
      onTap: () {
        setState(() {
          widget.indexIsChecked = !widget.indexIsChecked;
          widget.onCheckBoxTap(widget.index);
        });
      },
    );
  }
}
