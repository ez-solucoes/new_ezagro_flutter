import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/approvals_module/approvals_list/approvals_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/home/home_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/registers_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_tiles/custom_notification_tile_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/logout_dialog/logout_dialog.dart';

import '../../../../consts/app_routes.dart';
import '../../../../design_system/drawables/app_drawables.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/buttons/custom_menu_button.dart';
import '../purchase_request/purchase_request_list/purchase_request_list_page.dart';

class HomePage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appHomePage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);

  const HomePage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();
    controller.getClientName();
    controller.getPurchasesByStatusId(2);
    controller.getServiceOrdersByStatusId(5);

    return Observer(builder: (context) {
      return BackgroundWidget(
        scrollable: false,
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.welcomeAndEmployeeName,
          employeeName: controller.clientName,
        ),
        child: Column(
          children: [
            Observer(
                builder: (context) => controller.totalPurchases > 0
                    ? CustomNotificationTileWidget(
                        totalNotification: controller.totalApprovals,
                        totalUrgentNotifications: controller.totalUrgentPurchases,
                        type: 'approvals',
                      )
                    : Container()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomMenuButton(
                        title: AppStringsPortuguese.pluralRequestTitle,
                        icon: SvgPicture.asset(
                          AppDrawables.requestIcon,
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryBlackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () {
                          PurchaseRequestListPage.navigate();
                        }),
                  ),
                  const SizedBox(width: 34),
                  Expanded(
                    child: CustomMenuButton(
                        title: AppStringsPortuguese.pluralServicesOrderTitle,
                        icon: SvgPicture.asset(
                          AppDrawables.serviceOrderIcon,
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryBlackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () {}),
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
                        icon: SvgPicture.asset(
                          AppDrawables.registerIcon,
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryBlackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () => RegistersPage.navigate()),
                  ),
                  const SizedBox(width: 34),
                  Expanded(
                    child: CustomMenuButton(
                        title: AppStringsPortuguese.pluralApprovalsTitle,
                        icon: SvgPicture.asset(
                          AppDrawables.approvalIcon,
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryBlackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () {
                          ApprovalsListPage.navigate();
                        }),
                  ),
                ],
              ),
            ),
            Expanded(child: const SizedBox(width: 34)),
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              child: LogoutDialog(),
                            ),
                          );
                        },
                        label: 'Sair',
                        backgroundColor: Colors.white,
                        borderColor: AppColors.darkGreyColor,
                        textColor: AppColors.primaryBlackColor,
                      ),
                    ),),
              ],
            ),
          ],
        ),
      );
    });
  }
}
