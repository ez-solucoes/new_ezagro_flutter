import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_text_styles.dart';

enum AppBarType {
  stepsAndBackArrow,
  backArrow,
  titleAndBackArrow,
  centeredTitleAndBackArrow,
  hamburgerAndTitle,
  hamburgerAndEmployee,
}

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final AppBarType appBarType;

  final String? employeeName;
  final String? title;
  final double? indicatorValue;
  final bool showBackButton;
  final bool showProgressIndicator;
  final bool showHamburgerMenu;
  final bool showNotificationIcon;
  final Function()? onTap;
  final VoidCallback? callback;


  const CustomAppBarWidget({
    super.key,
    this.employeeName,
    this.title,
    this.indicatorValue,
    this.showBackButton = false,
    this.showProgressIndicator = false,
    this.showHamburgerMenu = false,
    this.showNotificationIcon = false,
    this.callback,
    this.onTap,
    required this.appBarType,
  });

  @override
  Widget build(BuildContext context) {
    switch (appBarType) {
      case AppBarType.stepsAndBackArrow:
        return _buildStepsAndBackArrow;
      case AppBarType.backArrow:
        return _buildBackArrow;
      case AppBarType.titleAndBackArrow:
        return _buildTitleAndBackArrow(context);
      case AppBarType.centeredTitleAndBackArrow:
        return _buildCenteredTitleAndBackArrow(context);
      case AppBarType.hamburgerAndTitle:
        return _buildHamburgerAndTitle(context);
      case AppBarType.hamburgerAndEmployee:
        return _buildHamburgerAndEmployee;
      default:
        return AppBar();
    }
  }

  AppBar get _buildStepsAndBackArrow => AppBar(
    backgroundColor: AppColors.whiteColor,
    scrolledUnderElevation: 0,
    title: Column(
      children: [
        GestureDetector(
          onTap: () => callback,
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios, size: 19),
              Text(
                AppStrings.backString,
                style: AppTextStyles.labelTextButtonStyle(color: AppColors.blackColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        LinearProgressIndicator(
          value: indicatorValue,
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(8),
        )
      ],
    ),
  );

  AppBar get _buildBackArrow => AppBar(
    backgroundColor: AppColors.whiteColor,
    scrolledUnderElevation: 0,
    title: Column(
      children: [
        GestureDetector(
          onTap: () => callback,
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios, size: 19),
              Text(
                AppStrings.backString,
                style: AppTextStyles.labelTextButtonStyle(
                    color: AppColors.blackColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
      ],
    ),
  );

  AppBar _buildTitleAndBackArrow(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      scrolledUnderElevation: 0,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => callback,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios, size: 19),
                    Text(
                      AppStrings.backString,
                      style: AppTextStyles.labelTextButtonStyle(color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
              title != null
                  ? Text(title!,
                  style: AppTextStyles.appBarTitleTextStyle(color: AppColors.blackColor))
                  : Text('',
                  style: AppTextStyles.appBarTitleTextStyle(color: AppColors.blackColor)),
            ],
          ),
        ],
      ),
    );}

  AppBar _buildCenteredTitleAndBackArrow(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      scrolledUnderElevation: 0,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios, size: 19),
                    Text(
                      AppStrings.backString,
                      style: AppTextStyles.labelTextButtonStyle(color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
              title != null
                  ? Text(title!,
                  style: AppTextStyles.appBarTitleTextStyle(color: AppColors.blackColor))
                  : Text('',
                  style: AppTextStyles.appBarTitleTextStyle(color: AppColors.blackColor)),
              const SizedBox(width: 60,)
            ],
          ),
        ],
      ),
    );}

    AppBar _buildHamburgerAndTitle(BuildContext context) {
      return AppBar(
        backgroundColor: AppColors.whiteColor,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Stack(
          children: [
            Center(
                child: Text('\n$title',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyTextStyle(
                        color: AppColors.blackColor))),
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(onPressed: () {
                  Scaffold.of(context).openDrawer();
                }, icon: const Icon(Icons.menu, size: 35))),
          ],
        ),
      );
    }

    AppBar get _buildHamburgerAndEmployee => AppBar(
      backgroundColor: AppColors.whiteColor,
      scrolledUnderElevation: 0,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Olá,\n$employeeName',
          textAlign: TextAlign.start,
          style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.blackColor),
        ),
      ),
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu, size: 35)),
    );

    @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  }

