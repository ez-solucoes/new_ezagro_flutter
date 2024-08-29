import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_drawables.dart';

class BackgroundWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool scrollable;
  final Widget child;

  const BackgroundWidget({super.key, required this.child, this.appBar, required this.scrollable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDF6ED),
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
                  colorFilter: const ColorFilter.mode(Color(0xffFDFDFD), BlendMode.srcIn),
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
