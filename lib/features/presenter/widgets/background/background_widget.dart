import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_drawer/custom_drawer_widget.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/drawables/app_drawables.dart';

class BackgroundWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool scrollable;
  final Widget child;
  final bool needsDrawer;
  final Widget? floatButton;
  final bool? resizeToAvoidBottomInset;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const BackgroundWidget({super.key,this.floatingActionButtonLocation, required this.scrollable, this.floatButton, required this.child, this.appBar, this.needsDrawer = false, this.resizeToAvoidBottomInset = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
      drawer: needsDrawer ? CustomDrawerWidget() : null,
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
      floatingActionButton: floatButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
