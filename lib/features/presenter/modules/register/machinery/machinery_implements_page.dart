import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/machinery/machinery_controller.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';

class MachineryImplementsPage extends StatelessWidget {
  final ArgParams args;
  static const String routePath = AppRoutes.appMachineryPage;

  static void navigate(ArgParams args) => Modular.to.navigate(routePath, arguments: args);

  static Future<Object?> push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();

  const MachineryImplementsPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<MachineryController>();

    return BackgroundWidget(
        scrollable: true,
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStringsPortuguese.singularFarmTitle,
          callback: () => MachineryImplementsPage.pop(),
        ),
        child: Observer(
          builder: (context) => controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ));
  }
}
