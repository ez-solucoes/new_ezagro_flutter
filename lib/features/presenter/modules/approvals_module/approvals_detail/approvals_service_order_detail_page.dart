import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/generic_info_card/generic_info_card.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/custom_info_card/custom_info_card_widget.dart';
import '../../../widgets/custom_list_item/custom_list_item_widget.dart';
import '../../../widgets/list_title_card/list_title_card_widget.dart';
import '../approvals_list/approvals_list_page.dart';
import 'approvals_detail_controller.dart';

class ApprovalsServiceOrderDetailPage extends StatelessWidget {
  final ArgParams args;
  static const String routePath = AppRoutes.appApprovalsServiceOrderDetailPage;

  static void navigate(ArgParams args) => Modular.to.navigate(routePath, arguments: args);

  static void push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();

  const ApprovalsServiceOrderDetailPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ApprovalsDetailController>();
    controller.getServiceOrderById(args.firstArgs);

    return BackgroundWidget(
      scrollable: true,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: AppStringsPortuguese.approvalsString,
        callback: () => ApprovalsListPage.navigate(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(builder: (context) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(children: [
              GenericInfoCard(
                sectionsData: [
                  (
                    [
                      ('Tipo', 'Ordem de Serviço'),
                    ],
                    [
                      (
                        'ID',
                        controller.serviceOrder?.id == null
                            ? ''
                            : controller.serviceOrder!.id.toString()
                      ),
                    ]
                  )
                ],
              ),
              SizedBox(height: 10),
              GenericInfoCard(
                sectionsData: [
                  (
                    [
                      (
                        'Responsável',
                        controller.serviceOrder?.employees?.first.employee?.name == null
                            ? ''
                            : controller.serviceOrder!.employees!.first.employee!.name!
                      ),
                      (
                        'Fazenda',
                        controller.serviceOrder?.farm?.name == null
                            ? ''
                            : controller.serviceOrder!.farm!.name!
                      ),
                    ],
                    [
                      (
                        'Data de Criação',
                        controller.serviceOrder?.createdAt == null
                            ? ''
                            : controller.serviceOrder!.createdAt!
                      ),
                      (
                        'Centro de Custo',
                        controller.serviceOrder?.localCostCenter?.name == null
                            ? ''
                            : controller.serviceOrder!.localCostCenter!.name!
                      ),
                    ]
                  )
                ],
              ),
              SizedBox(height: 10),
          Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                            ],
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return CustomListItemWidget(
                              label: controller.informationList[index][0],
                              informationText: controller.informationList[index][1],
                              backgroundColor: index % 2 == 0
                                  ? AppColors.primaryWhiteColor
                                  : AppColors.softGreenColor,
                              rightIcon: controller.informationList[index][0] == "Talhões:"
                                  ? Icons.navigate_next
                                  : null,
                              type: controller.informationList[index][0] == "Talhões:"
                                  ? ListItemType.oneIconButton
                                  : ListItemType.regular);
                        },
                      ),
                    ),
                        const SizedBox(height: 10),
                        CustomInfoCardWidget(
                            labelOne: AppStringsPortuguese.cropLabel,
                            textOne: controller.serviceOrder?.cropVariety?.crop?.name ?? "",
                            labelTwo: '${AppStringsPortuguese.varietyLabel}:',
                            textTwo: controller.serviceOrder?.cropVariety?.name ?? "",
                            labelThree: '${AppStringsPortuguese.technologyLabel}:',
                            textThree: controller.serviceOrder?.cropVariety?.technologyName ?? "",
                            icon: Icons.edit_outlined,
                            infoCardType: InfoCardType.threeLabeledInfo),
                        const SizedBox(height: 10.0),
          Container(
                decoration: BoxDecoration(
                    color: AppColors.borderWhiteColor, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTitleCardWidget(text: AppStringsPortuguese.executorsLabel),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          (controller.serviceOrder?.employees?.map((e) => e.employee?.name) ?? [])
                              .toList()
                              .length,
                      itemBuilder: (context, index) {
                        return CustomListItemWidget(
                            informationText: controller.serviceOrder?.employees
                                    ?.map((e) => e.employee!.name)
                                    .toList()[index] ??
                                "",
                            backgroundColor: index % 2 == 0
                                ? AppColors.primaryWhiteColor
                                : AppColors.softGreenColor,
                            leftIcon: Icons.edit_outlined,
                            rightIcon: Icons.delete_outline,
                            type: ListItemType.regular);
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.borderWhiteColor, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTitleCardWidget(text: AppStringsPortuguese.machineryLabel),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (controller.serviceOrder?.machineryImplements
                                  ?.map((e) => e.machineryImplement?.nickname)
                                  .toList() ??
                              [])
                          .length,
                      itemBuilder: (context, index) {
                        return CustomListItemWidget(
                            informationText: (controller.serviceOrder?.machineryImplements
                                        ?.map((e) => e.machineryImplement?.nickname)
                                        .toList() ??
                                    [])[index] ??
                                "",
                            backgroundColor: index % 2 == 0
                                ? AppColors.primaryWhiteColor
                                : AppColors.softGreenColor,
                            type: ListItemType.twoIconButtons);
                      },
                    ),
                    const SizedBox(height: 10,),
                CustomInfoCardWidget(
                                labelOne: AppStringsPortuguese.estimatedStartDateLabel,
                                textOne: controller.serviceOrder?.expectedStartDate ?? "",
                                labelTwo: AppStringsPortuguese.estimatedEndDateLabel,
                                textTwo: controller.serviceOrder?.expectedEndDate ?? "",
                                icon: Icons.edit_outlined,
                                infoCardType: InfoCardType.twoLabeledInfo,
                ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryWhiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 0.30* MediaQuery.of(context).size.height),
                        child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text('Produtos',
                                            style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              Divider(color: AppColors.borderWhiteColor),
                              Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text('Nome',
                                          style: AppTextStyles.smallBoldTextStyle(
                                              color: AppColors.primaryBlackColor),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Text('Quantidade',
                                        style: AppTextStyles.smallBoldTextStyle(
                                            color: AppColors.primaryBlackColor),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(width: 40),
                                    ],
                                  )
                              ),
                              Divider(color: AppColors.borderWhiteColor),
                              Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.serviceOrder?.productInputRecommendations == null ? 0 : controller.serviceOrder?.productInputRecommendations!.length,
                                      itemBuilder: (context, index) {
                                        final item = controller.serviceOrder?.productInputRecommendations![index];
                                        return ExpansionTile(
                                            showTrailingIcon: false,
                                            title: Container(
                                              color: index%2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
                                              child: Padding(
                                                padding: EdgeInsets.only(top:10.0, bottom: 10.0),
                                                child: Row(
                                                    children: [
                                                      index == 0 ? Divider(color: AppColors.borderWhiteColor) : SizedBox.shrink(),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text('${item?.recommendation}',
                                                          style: AppTextStyles.appBarSubTitleTextStyle(
                                                              color: AppColors.primaryBlackColor),
                                                          textAlign: TextAlign.start,
                                                        ),
                                                      ),
                                                      Text('${item?.quantity}',
                                                          style: AppTextStyles.appBarSubTitleTextStyle(
                                                              color: AppColors.primaryBlackColor),
                                                          textAlign:TextAlign.center),
                                                      SizedBox(width: 30),
                                                      Text('',
                                                        style: AppTextStyles.appBarSubTitleTextStyle(
                                                            color: AppColors.primaryBlackColor),
                                                        textAlign: TextAlign.center,),
                                                      SizedBox(width: 20),
                                                    ]),
                                              ),
                                            ),
                                        );
                                      }
                                  )
                              ),
                              const SizedBox(height: 10),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     color: AppColors.primaryWhiteColor,
                              //     borderRadius: BorderRadius.circular(5),
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.grey.withValues(alpha: 0.5),
                              //         spreadRadius: 2,
                              //         blurRadius: 5,
                              //         offset: const Offset(0, 3),
                              //       ),
                              //     ],
                              //   ),
                              //   child: ConstrainedBox(
                              //     constraints: BoxConstraints(maxHeight: 0.4* MediaQuery.of(context).size.height),
                              //     child: Column(
                              //         children: [
                              //           Padding(
                              //               padding: const EdgeInsets.all(15.0),
                              //               child: Row(
                              //                   children: [
                              //                     Expanded(
                              //                       flex: 2,
                              //                       child: Text('Insumos',
                              //                         style: AppTextStyles.appBarSubTitleTextStyle(color: AppColors.primaryBlackColor),
                              //                         textAlign: TextAlign.start,
                              //                       ),
                              //                     ),
                              //                   ]
                              //               )
                              //           ),
                              //           Divider(color: AppColors.borderWhiteColor),
                              //           Padding(
                              //               padding: const EdgeInsets.all(15.0),
                              //               child: Row(
                              //                 children: [
                              //                   Expanded(
                              //                     flex: 2,
                              //                     child: Text('Nome',
                              //                       style: AppTextStyles.smallBoldTextStyle(
                              //                           color: AppColors.primaryBlackColor),
                              //                       textAlign: TextAlign.start,
                              //                     ),
                              //                   ),
                              //                   Text('Quantidade',
                              //                     style: AppTextStyles.smallBoldTextStyle(
                              //                         color: AppColors.primaryBlackColor),
                              //                     textAlign: TextAlign.start,
                              //                   ),
                              //                   SizedBox(width: 40),
                              //                 ],
                              //               )
                              //           ),
                              //           Divider(color: AppColors.borderWhiteColor),
                              //           Expanded(
                              //               child: ListView.builder(
                              //                   shrinkWrap: true,
                              //                   itemCount: controller.serviceOrder?.productInputRecommendations == null ? 0 : controller.serviceOrder!.productInputRecommendations!.length,
                              //                   itemBuilder: (context, index) {
                              //                     final item = controller.serviceOrder!.productInputRecommendations![index];
                              //                     return ExpansionTile(
                              //                         showTrailingIcon: false,
                              //                         title: Container(
                              //                           color: index%2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor,
                              //                           child: Padding(
                              //                             padding: EdgeInsets.only(top:10.0, bottom: 10.0),
                              //                             child: Row(
                              //                                 children: [
                              //                                   index == 0 ? Divider(color: AppColors.borderWhiteColor) : SizedBox.shrink(),
                              //                                   Expanded(
                              //                                     flex: 1,
                              //                                     child: Text('${item.agriculturalInput?.trademark}',
                              //                                       style: AppTextStyles.appBarSubTitleTextStyle(
                              //                                           color: AppColors.primaryBlackColor),
                              //                                       textAlign: TextAlign.start,
                              //                                     ),
                              //                                   ),
                              //                                   Text('${item.recommendationPerHectare}',
                              //                                       style: AppTextStyles.appBarSubTitleTextStyle(
                              //                                           color: AppColors.primaryBlackColor),
                              //                                       textAlign:TextAlign.center),
                              //                                   SizedBox(width: 30),
                              //                                   Text('${item.product?.measurementUnit?.symbol?.toUpperCase()}',
                              //                                     style: AppTextStyles.appBarSubTitleTextStyle(
                              //                                         color: AppColors.primaryBlackColor),
                              //                                     textAlign: TextAlign.center,),
                              //                                   SizedBox(width: 20),
                              //                                 ]),
                              //                           ),
                              //                         ),
                              //                     );
                              //
                              //                   }
                              //               )
                              //           ),
                              //         ]
                              //     ),
                              //   ),
                              // ),
                            ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              onPressed: () {
                                try {
                                  controller.cancelServiceOrderById(args.firstArgs);
                                  CustomSnackBarWidget.show(SnackBarType.success, context, 'Ordem de Serviço ${args.firstArgs}/n cancelada com sucesso!');
                                  pop();
                                  ApprovalsListPage.navigate;
                                } catch (e) {
                                  CustomSnackBarWidget.show(SnackBarType.error, context, 'Erro ao cancelar \nOrdem de Serviço ${args.firstArgs}');
                                  return;
                                }
                              },
                              label: 'Cancelar',
                              backgroundColor: AppColors.primaryRedColor,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: CustomElevatedButton(
                              onPressed: () {
                                try{
                                  controller.approveServiceOrderById(args.firstArgs);
                                  CustomSnackBarWidget.show(SnackBarType.success, context, 'Ordem de Serviço ${args.firstArgs}/n aprovada com sucesso!');
                                  pop();
                                  ApprovalsListPage.navigate;
                                } catch (e) {
                                  CustomSnackBarWidget.show(SnackBarType.error, context, 'Erro ao aprovar \nOrdem de Serviço ${args.firstArgs}');
                                  return;
                                }
                              },
                              label: 'Aprovar',
                              backgroundColor: AppColors.primaryGreenColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]);
          }
        }),
      ),
    );
  }
}
