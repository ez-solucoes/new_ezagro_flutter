import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ezagro_flutter/consts/app_colors.dart';

import '../../../consts/app_drawables.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.whiteColor,
        child: Center(child: SvgPicture.asset(AppDrawables.ezAgroLogoIcon)));
  }
}
