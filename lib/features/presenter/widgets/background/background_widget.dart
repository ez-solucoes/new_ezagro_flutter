import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_drawables.dart';

class BackgroundWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool scrollable;
  final Widget child;

  const BackgroundWidget({super.key, required this.scrollable, required this.child, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: appBar,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                bottom: -100,
                right: -140,
                child: SvgPicture.asset(
                  AppDrawables.ezAgroLogoIcon,
                  colorFilter: const ColorFilter.mode(Color(0xffFFFBF5), BlendMode.srcIn),
                  width: 399,
                  height: 445,
                )),
            scrollable ? SingleChildScrollView(child: child) : child
          ],
        ),
      ),
    );
  }
}
