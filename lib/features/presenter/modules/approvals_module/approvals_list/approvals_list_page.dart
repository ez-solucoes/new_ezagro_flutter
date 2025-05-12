import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/approvals_module/approvals_detail/approvals_service_order_detail_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/home/home_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

import '../../../../../design_system/spacing/app_dimens.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../approvals_detail/approvals_purchase_request_detail_page.dart';
import 'approvals_list_controller.dart';

class ApprovalsListPage extends StatelessWidget {
  static const String routePath = AppRoutes.appApprovalsListPage;

  static navigate() => Modular.to.navigate(routePath);

  static push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  const ApprovalsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ApprovalsListController>();

    if (controller.purchaseRequestListEntities.isNotEmpty) {
      controller.purchaseRequestListEntities.clear();
    }

    controller.getPurchaseRequestByStatusId('2');
    controller.getServiceOrderByStatusId(5.toString());

    return BackgroundWidget(
      scrollable: false,
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStringsPortuguese.approvalsString,
          callback: () => HomePage.navigate(),
        ),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.pageIndex = 0;
                          controller.getPurchaseRequestByStatusId('2');
                        },
                        child: Observer(builder: (context) {
                          return Container(
                            color: controller.pageIndex == 0 ? Colors.white : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                              child: Center(
                                child: Text(
                                  'Solicitações',
                                  style: AppTextStyles.hintTextFieldTextStyle(
                                      color: AppColors.primaryBlackColor),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.pageIndex = 1;
                          controller.getServiceOrderByStatusId(5.toString());
                        },
                        child: Observer(builder: (context) {
                          return Container(
                            color: controller.pageIndex == 1 ? Colors.white : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                              child: Center(
                                child: Text(
                                  'Ordens de Serviço',
                                  style: AppTextStyles.hintTextFieldTextStyle(
                                      color: AppColors.primaryBlackColor),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       CustomElevatedButton(
              //         onPressed: () {},
              //         label: 'Rejeitar Todas',
              //         backgroundColor: AppColors.primaryRedColor,
              //       ),
              //       CustomElevatedButton(
              //         onPressed: () {},
              //         label: 'Aprovar Todas',
              //         backgroundColor: AppColors.primaryGreenColor,
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Container(
                    padding: EdgeInsets.only(right: 10, left: 10, top: 20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ID',
                                style: AppTextStyles.appBarTitleTextStyle(
                                    color: AppColors.primaryBlackColor)),
                            Observer(
                              builder: (context) {
                                return Text(controller.pageIndex == 0 ? 'Solicitação' : 'Ordem de serviço',
                                    style: AppTextStyles.appBarTitleTextStyle(
                                        color: AppColors.primaryBlackColor));
                              }
                            ),
                            Text('Centro de custo',
                                style: AppTextStyles.appBarTitleTextStyle(
                                    color: AppColors.primaryBlackColor)),
                            Text('CheckBox',
                                style:
                                    AppTextStyles.appBarTitleTextStyle(color: Colors.transparent)),
                          ],
                        ),
                        const SizedBox(height: AppDimens.titleDimen),
                        Observer(
                          builder: (context) => controller.isLoading
                              ? Center(child: const CircularProgressIndicator())
                              : Flexible(
                                  child: Observer(
                                    builder: (context) => controller.pageIndex == 0
                                        ? ListView.separated(
                                            itemCount: controller.purchaseRequestListEntities.length,
                                            itemBuilder: (context, index) {
                                              List<dynamic> listItens;
                                                listItens = controller.purchaseRequestListEntities;
                                              return GestureDetector(
                                                onTap: () {
                                                  ApprovalsPurchaseRequestDetailPage.navigate(
                                                      ArgParams(firstArgs: listItens[index].id, secondArgs: 'purchase-request'));
                                                },
                                                child: Dismissible(
                                                    key: Key(index.toString()),
                                                    background: Container(
                                                      color: AppColors.primaryRedColor,
                                                      alignment: Alignment.centerRight,
                                                      padding: const EdgeInsets.only(right: 16.0),
                                                      margin: const EdgeInsets.symmetric(
                                                          horizontal: 16.0),
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: AppColors.primaryWhiteColor,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(listItens[index].id.toString(),
                                                            style: AppTextStyles
                                                                .appBarSubTitleTextStyle(
                                                                    color: AppColors
                                                                        .primaryBlackColor)),
                                                        const SizedBox(width: 20),
                                                        Text(listItens[index].type!.name!,
                                                            textAlign: TextAlign.start,
                                                            style: AppTextStyles
                                                                .appBarSubTitleTextStyle(
                                                                    color: AppColors
                                                                        .primaryBlackColor)),
                                                        const SizedBox(width: 10),
                                                        Text(
                                                            listItens[index].costCenter == null
                                                                ? ''
                                                                : listItens[index]
                                                                    .costCenter!
                                                                    .name!,
                                                            style: AppTextStyles
                                                                .appBarSubTitleTextStyle(
                                                                    color: AppColors
                                                                        .primaryBlackColor)),
                                                        const SizedBox(width: 10),
                                                        Icon(Icons.navigate_next),
                                                      ],
                                                    )),
                                              );
                                            },
                                            separatorBuilder: (BuildContext context, int index) {
                                              return Divider(color: AppColors.borderWhiteColor);
                                            },
                                          )
                                        : ListView.separated(
                                            itemCount: controller.serviceOrderListEntities.length,
                                            itemBuilder: (context, index) {
                                              List<dynamic> listItens;

                                              listItens = controller.serviceOrderListEntities;

                                              return GestureDetector(
                                                onTap: () {
                                                  ApprovalsServiceOrderDetailPage.navigate(
                                                      ArgParams(firstArgs: listItens[index].id, secondArgs: 'service-order'));
                                                },
                                                child: Dismissible(
                                                    key: Key(index.toString()),
                                                    background: Container(
                                                      color: AppColors.primaryRedColor,
                                                      alignment: Alignment.centerRight,
                                                      padding: const EdgeInsets.only(right: 16.0),
                                                      margin: const EdgeInsets.symmetric(
                                                          horizontal: 16.0),
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: AppColors.primaryWhiteColor,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(listItens[index].id.toString(),
                                                            style: AppTextStyles
                                                                .appBarSubTitleTextStyle(
                                                                    color: AppColors
                                                                        .primaryBlackColor)),
                                                        const SizedBox(width: 20),
                                                        Text(listItens[index].agriculturalActivity!.activityType!.name!,
                                                            style: AppTextStyles
                                                                .appBarSubTitleTextStyle(
                                                                    color: AppColors
                                                                        .primaryBlackColor)),
                                                        const SizedBox(width: 10),
                                                        Text(
                                                            listItens[index].localCostCenter == null
                                                                ? ''
                                                                : listItens[index]
                                                                    .localCostCenter!
                                                                    .name!,
                                                            style: AppTextStyles
                                                                .appBarSubTitleTextStyle(
                                                                    color: AppColors
                                                                        .primaryBlackColor)),
                                                        const SizedBox(width: 10),
                                                        Icon(Icons.navigate_next),
                                                      ],
                                                    )),
                                              );
                                            },
                                            separatorBuilder: (BuildContext context, int index) {
                                              return Divider(color: AppColors.borderWhiteColor);
                                            },
                                          ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
