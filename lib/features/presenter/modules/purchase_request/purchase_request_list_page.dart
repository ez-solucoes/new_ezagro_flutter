import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_ezagro_flutter/design_system/drawables/app_drawables.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/home/home_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_controllers/purchase_request_list_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

import '../../../../consts/app_routes.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/spacing/app_dimens.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../widgets/boxes/step_box_widget.dart';

class PurchaseRequestListPage extends StatelessWidget {
  static const String routePath = AppRoutes.appPurchaseRequestListPage;

  static navigate() => Modular.to.navigate(routePath);

  static push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  const PurchaseRequestListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<PurchaseRequestListController>();

    controller.getAllPurchaseRequests();

    return BackgroundWidget(
      scrollable: false,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: AppStringsPortuguese.pluralRequestTitle,
        callback: () => HomePage.navigate(),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 5),
                        Text('ID',
                            style: AppTextStyles.appBarTitleTextStyle(
                                color: AppColors.primaryBlackColor)),
                        Text('Solicitação',
                            style: AppTextStyles.appBarTitleTextStyle(
                                color: AppColors.primaryBlackColor)),
                        Text('Centro de custo',
                            style: AppTextStyles.appBarTitleTextStyle(
                                color: AppColors.primaryBlackColor)),
                        Text('Etapa',
                            style: AppTextStyles.appBarTitleTextStyle(
                                color: AppColors.primaryBlackColor)),
                        SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(height: AppDimens.titleDimen),
                    Observer(
                      builder: (context) => controller.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Flexible(
                              child: ListView.separated(
                                itemCount: 3,
                                separatorBuilder: (context, index) =>
                                    Divider(color: AppColors.borderWhiteColor),
                                itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {},
                                  child: Dismissible(
                                    direction: DismissDirection.startToEnd,
                                    onDismissed: (startToEnd){
                                      debugPrint('dismiss');
                                    },
                                    confirmDismiss: (direction) async {
                                      return false;
                                    },
                                    key: Key(index.toString()),
                                    background: Container(
                                      color: AppColors.primaryRedColor,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(right: 16.0),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Icon(
                                        Icons.delete,
                                        color: AppColors.primaryWhiteColor,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 10,
                                          decoration: BoxDecoration(color: AppColors.primaryRedColor),
                                          child: SvgPicture.asset(AppDrawables.warningWhiteIcon),
                                        ),
                                        Text('ID',
                                            style: AppTextStyles.appBarSubTitleTextStyle(
                                                color: AppColors.primaryBlackColor)),
                                        const SizedBox(width: 10),
                                        Text('Produto',
                                            style: AppTextStyles.appBarSubTitleTextStyle(
                                                color: AppColors.primaryBlackColor)),
                                        const SizedBox(width: 10),
                                        Text('Uberaba',
                                            style: AppTextStyles.appBarSubTitleTextStyle(
                                                color: AppColors.primaryBlackColor)),
                                        const SizedBox(width: 10),
                                        StepBoxWidget(step: 'Pedido de Compra'),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
