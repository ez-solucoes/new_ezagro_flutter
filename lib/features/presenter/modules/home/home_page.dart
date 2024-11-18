import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/create_service_order_page/create_service_order_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_list_page/service_order_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_outlined_button.dart';
import '../../../../consts/app_routes.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../../domain/params/arg_params/arg_params.dart';

class HomePage extends StatelessWidget {

  final ArgParams? args;
  static const String routePath = AppRoutes.appHomePage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);

  const HomePage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        appBar: CustomAppBarWidget(
          indicatorValue: 0.8,
          title: AppStringsPortuguese.appCapitalTile,
          appBarType: AppBarType.hamburgerAndTitle,
        ),
        scrollable: true,
        needsDrawer: true,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomElevatedButton(onPressed: (){ServiceOrderListPage.navigate();}, label: AppStringsPortuguese.pluralServicesOrder),
              CustomOutlinedButton(onPressed: (){CreateServiceOrderPage.navigate();}, label: AppStringsPortuguese.createServiceOrder, textStyle: AppTextStyles.boldMediumTextStyle(color: AppColors.primaryBlackColor))
            ],
          ),
        ));
  }

}