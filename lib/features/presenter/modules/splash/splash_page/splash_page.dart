import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/login_pages/login_page.dart';

import '../../../../../core/connection_manager/connection_status.dart';
import '../../../../../design_system/drawables/app_drawables.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    final connectionStatus = Modular.get<ConnectionStatus>();
    connectionStatus.initialize();

    Timer.periodic(Duration(seconds: 3), (timer){
      timer.cancel();
      LoginPage.navigate();

    });
  }

  @override
  dispose(){
    Modular.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Container(
        color: AppColors.backgroundColor,
        child: Center(child: SvgPicture.asset(AppDrawables.ezAgroLogoIcon)));
  }
}
