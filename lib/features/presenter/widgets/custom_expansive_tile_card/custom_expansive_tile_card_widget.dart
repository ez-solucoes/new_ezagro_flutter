import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

class CustomExpansiveTileCardWidget extends StatefulWidget {
  final List<List<String>> data;
  final Function(int) onTap;
  final int index;

  const CustomExpansiveTileCardWidget(
      {super.key, required this.data, required this.onTap, required this.index});

  @override
  State<CustomExpansiveTileCardWidget> createState() => _CustomExpansiveTileCardWidgetState();
}

class _CustomExpansiveTileCardWidgetState extends State<CustomExpansiveTileCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: widget.index % 2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Row(
              children: [
                widget.index == 0 ? Divider(color: AppColors.borderWhiteColor) : SizedBox.shrink(),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.data[widget.index][0],
                    style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                    textAlign: TextAlign.start,
                  ),
                ),
                Text(widget.data[widget.index][1],
                    style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                    textAlign: TextAlign.center),
                SizedBox(width: 30),
                Text(
                  widget.data[widget.index][2],
                  style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 20),
              ],
            ),
            if(isExpanded)
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Teste de expanção')
              )
          ],
        )

      ),
    );
  }
}
// Container(
// color: widget.index % 2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
// child: Padding(
// padding: EdgeInsets.all(10.0),
// child: Row(children: [
// widget.index == 0 ? Divider(color: AppColors.borderWhiteColor) : SizedBox.shrink(),
// Expanded(
// flex: 1,
// child: Text(
// widget.data[widget.index][0],
// style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
// textAlign: TextAlign.start,
// ),
// ),
// Text(widget.data[widget.index][1],
// style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
// textAlign: TextAlign.center),
// SizedBox(width: 30),
// Text(
// widget.data[widget.index][2],
// style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
// textAlign: TextAlign.center,
// ),
// SizedBox(width: 20),
// ]),
// ),
// )