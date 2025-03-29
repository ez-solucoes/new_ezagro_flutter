import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/approvals_module/approvals_list/approvals_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/registers_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

import '../../../../consts/app_routes.dart';
import '../../../../design_system/drawables/app_drawables.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../widgets/buttons/custom_menu_button.dart';

class HomePage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appHomePage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);

  const HomePage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      scrollable: false,
      appBar: CustomAppBarWidget(appBarType: AppBarType.hamburgerAndEmployee),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomMenuButton(
                      title: AppStringsPortuguese.pluralRequestTitle,
                      icon: SvgPicture.asset(AppDrawables.requestIcon),
                      onPressed: () {}
                  ),
                ),
                const SizedBox(width: 34),
                Expanded(
                  child: CustomMenuButton(
                      title: AppStringsPortuguese.pluralServicesOrderTitle,
                      icon: SvgPicture.asset(AppDrawables.serviceOrderIcon),
                      onPressed: () {}
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomMenuButton(
                      title: AppStringsPortuguese.pluralRegistersTitle,
                      icon: SvgPicture.asset(AppDrawables.registerIcon),
                      onPressed: () => RegistersPage.navigate()
                  ),
                ),
                const SizedBox(width: 34),
                Expanded(
                  child: CustomMenuButton(
                      title: AppStringsPortuguese.pluralApprovalsTitle,
                      icon: SvgPicture.asset(AppDrawables.approvalIcon),
                      onPressed: () {
                        ApprovalsListPage.navigate();
                      }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
