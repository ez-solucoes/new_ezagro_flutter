import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';

import '../../../../../core/connection_manager/connection_status.dart';
import '../../../../../design_system/drawables/app_drawables.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionStatus = Modular.get<ConnectionStatus>();
    connectionStatus.initialize();

    return Container(
        color: AppColors.backgroundColor,
        child: Center(child: SvgPicture.asset(AppDrawables.ezAgroLogoIcon)));
  }
}
