import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/home/home_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_general_info_first_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_detail/purchase_request_detail_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_list/purchase_request_list_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_floating_action_button_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/spacing/app_dimens.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../domain/entities/purchase_request_entities/purchase_request_entity.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/boxes/step_box_widget.dart';

class PurchaseRequestListPage extends StatelessWidget {
  static const String routePath = AppRoutes.appPurchaseRequestListPage;

  static void navigate() => Modular.to.navigate(routePath);

  static Future<Object?> push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  const PurchaseRequestListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<PurchaseRequestListController>();

    controller.getAllPurchaseRequests();

    return BackgroundWidget(
      scrollable: false,
      floatButton: CustomFloatingActionButtonWidget(
        onPressed: () {
          PurchaseRequestCreateGeneralInfoFirstPage.navigate();
        },
        backgroundColor: AppColors.primaryWhiteColor,
        icon: Icons.add,
        iconColor: AppColors.primaryBlackColor,
        heroTag: 'create_purchase_request',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Text('ID',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.appBarTitleTextStyle(color: AppColors.primaryBlackColor)),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('Solicitação',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.appBarTitleTextStyle(color: AppColors.primaryBlackColor)),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('Centro de custo',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.appBarTitleTextStyle(color: AppColors.primaryBlackColor)),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('Etapa',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.appBarTitleTextStyle(color: AppColors.primaryBlackColor)),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(height: AppDimens.titleDimen),
                    Observer(
                      builder: (context) => controller.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Flexible(
                              child: ListView.separated(
                                itemCount: controller.purchaseRequestListEntities.length,
                                separatorBuilder: (context, index) => Divider(color: AppColors.borderWhiteColor),
                                itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    PurchaseRequestDetailPage.push(
                                        ArgParams(firstArgs: controller.purchaseRequestListEntities[index].id));
                                  },
                                  child: Dismissible(
                                    direction: DismissDirection.startToEnd,
                                    onDismissed: (startToEnd) {
                                      debugPrint('dismiss');
                                    },
                                    confirmDismiss: (direction) async {
                                      return false;
                                    },
                                    key: Key(index.toString()),
                                    background: _buildDismissibleItem(controller.purchaseRequestListEntities[index]),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        _buildDismissibleContainer(controller.purchaseRequestListEntities[index]),
                                        SizedBox(width: 10),
                                        Expanded(
                                          flex: 1,
                                          child: Text(controller.purchaseRequestListEntities[index].id.toString(),
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              maxLines: 2,
                                              style: AppTextStyles.appBarSubTitleTextStyle(
                                                  color: AppColors.primaryBlackColor)),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(controller.purchaseRequestListEntities[index].type!.name!,
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              maxLines: 2,
                                              style: AppTextStyles.appBarSubTitleTextStyle(
                                                  color: AppColors.primaryBlackColor)),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(controller.purchaseRequestListEntities[index].costCenter!.name!,
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              maxLines: 2,
                                              style: AppTextStyles.appBarSubTitleTextStyle(
                                                  color: AppColors.primaryBlackColor)),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: StepBoxWidget(
                                                step: controller.purchaseRequestListEntities[index].step!.name!)),
                                        SizedBox(width: 10),
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

  Widget _buildDismissibleContainer(PurchaseRequestEntity purchaseRequestItem) {
    if (purchaseRequestItem.isUrgent! && purchaseRequestItem.hasErrorInOrderItem!) {
      return Container(
        width: 10,
        decoration: BoxDecoration(color: AppColors.primaryBlackColor),
        child: Icon(Icons.gpp_bad_outlined, color: AppColors.primaryWhiteColor),
      );
    } else if (purchaseRequestItem.isUrgent! && !purchaseRequestItem.hasErrorInOrderItem!) {
      return Container(
        width: 10,
        decoration: BoxDecoration(color: AppColors.primaryRedColor),
        child: Icon(Icons.gpp_bad_outlined, color: AppColors.primaryWhiteColor),
      );
    } else if (!purchaseRequestItem.isUrgent! && purchaseRequestItem.hasErrorInOrderItem!) {
      return Container(
        width: 10,
        decoration: BoxDecoration(color: AppColors.primaryYellowColor),
        child: Icon(Icons.gpp_bad_outlined, color: AppColors.primaryWhiteColor),
      );
    } else {
      return Container();
    }
  }

  Widget _buildDismissibleItem(PurchaseRequestEntity purchaseRequestItem) {
    if (purchaseRequestItem.isUrgent! && purchaseRequestItem.hasErrorInOrderItem!) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: AppColors.primaryBlackColor,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(Icons.gpp_bad_outlined, color: AppColors.primaryWhiteColor),
            SizedBox(width: 8.0),
            Text('ERROS URGENTES', style: AppTextStyles.appBarTitleTextStyle(color: AppColors.primaryWhiteColor)),
          ],
        ),
      );
    } else if (purchaseRequestItem.isUrgent! && !purchaseRequestItem.hasErrorInOrderItem!) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: AppColors.primaryRedColor,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: AppColors.primaryWhiteColor),
            SizedBox(width: 8.0),
            Text('URGENTE', style: AppTextStyles.appBarTitleTextStyle(color: AppColors.primaryWhiteColor)),
          ],
        ),
      );
    } else if (!purchaseRequestItem.isUrgent! && purchaseRequestItem.hasErrorInOrderItem!) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: AppColors.primaryYellowColor,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(Icons.warning_amber_outlined, color: AppColors.primaryWhiteColor),
            SizedBox(width: 8.0),
            Text('URGENTE', style: AppTextStyles.appBarTitleTextStyle(color: AppColors.primaryWhiteColor)),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
