import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/approvals_module/approvals_list/approvals_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_info_card/custom_info_card_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../widgets/custom_striped_list_widget/custom_striped_list_widget.dart';
import '../../../widgets/generic_info_card/generic_info_card.dart';
import 'approvals_detail_controller.dart';

class ApprovalsPurchaseRequestDetailPage extends StatelessWidget {
  final ArgParams args;
  static const String routePath = AppRoutes.appApprovalsPurchaseRequestDetailPage;

  static void navigate(ArgParams args) => Modular.to.navigate(routePath, arguments: args);

  static void push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();


  const ApprovalsPurchaseRequestDetailPage({super.key, required this.args});


  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ApprovalsDetailController>();
    controller.getPurchaseRequestById(args.firstArgs);

    return BackgroundWidget(
        scrollable: true,
        appBar: CustomAppBarWidget(
            appBarType: AppBarType.centeredTitleAndBackArrow,
            title: AppStringsPortuguese.approvalsString,
          callback: () => ApprovalsListPage.navigate(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Observer(builder: (context){
            if(controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  CustomInfoCardWidget(
                    infoCardType: InfoCardType.approvalType,
                    labelOne: 'Tipo',
                    textOne: controller.purchaseRequest?.type?.name == null ? '' : controller.purchaseRequest!.type!.name!,
                  ),
                  SizedBox(height: 10),
                  GenericInfoCard(
                      sectionsData: [
                        (
                        [
                          ('Responsável',  controller.purchaseRequest?.responsibleEmployee?.name == null ? '' : controller.purchaseRequest!.responsibleEmployee!.name!, false),
                          ('Data de Criação',  controller.purchaseRequest?.createdAt == null ? '' : controller.purchaseRequest!.createdAt!, false),
                          ('Data de Expiração',  controller.purchaseRequest?.quotationExpirationDate == null ? '' : controller.purchaseRequest!.quotationExpirationDate!, false),
                          ('Pagamento',  controller.purchaseRequest?.paymentMethod?.name == null ? '' : controller.purchaseRequest!.paymentMethod!.name, false),
                          ('Data de Pagamento',  controller.purchaseRequest?.paymentDate == null ? '' : controller.purchaseRequest!.paymentDate!, false),
                        ],
                        [
                          ('Id',  controller.purchaseRequest?.id == null ? '' : controller.purchaseRequest!.id.toString(), false),
                          ('Centro de Custo',  controller.purchaseRequest?.costCenter?.name == null ? '' : controller.purchaseRequest!.costCenter!.name!, false),
                          ('Fazenda', controller.purchaseRequest?.farm.name == null ? '' : controller.purchaseRequest!.farm.name!, false),
                          ('Etapa',  controller.purchaseRequest?.step == null ? '' : controller.purchaseRequest!.step!.name!, false),
                        ]
                        )
                      ]),
                  SizedBox(height: 10),
                  CustomStripedListWidget(
                      title: 'Empresas',
                      data: controller.purchaseRequest?.companies == null
                          ? ['sem empresa']
                          : controller.purchaseRequest!.companies!.map((e) => e.name!).toList(),
                      // data: widget.controller.purchaseRequest.companies!.map((e) => e.name!).toList(),
                      maxHeight: 0.7* MediaQuery.of(context).size.height,
                      onTap: (index){}),
                  SizedBox(height: 10),
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
                      constraints: BoxConstraints(maxHeight: 0.4* MediaQuery.of(context).size.height),
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
                                    itemCount: controller.purchaseRequest?.requestItems == null ? 0 : controller.purchaseRequest!.requestItems!.length,
                                    itemBuilder: (context, index) {
                                      final item = controller.purchaseRequest!.requestItems![index];
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
                                                      child: Text('${item.product?.trademark}',
                                                        style: AppTextStyles.appBarSubTitleTextStyle(
                                                            color: AppColors.primaryBlackColor),
                                                        textAlign: TextAlign.start,
                                                      ),
                                                    ),
                                                    Text('${item.requestedQuantity}',
                                                        style: AppTextStyles.appBarSubTitleTextStyle(
                                                            color: AppColors.primaryBlackColor),
                                                        textAlign:TextAlign.center),
                                                    SizedBox(width: 30),
                                                    Text('${item.product?.measurementUnit?.symbol?.toUpperCase()}',
                                                      style: AppTextStyles.appBarSubTitleTextStyle(
                                                          color: AppColors.primaryBlackColor),
                                                      textAlign: TextAlign.center,),
                                                    SizedBox(width: 20),
                                                  ]),
                                            ),
                                          ),

                                          children: [
                                            GenericInfoCard(
                                                sectionsData:
                                                [
                                                  (
                                                  [
                                                    ('Marca',  '${item.product?.registrationHolder}', false),
                                                    ('Vinculado à maquinário', '${item.machineryImplement?.nickname == null ? '' : item.machineryImplement!.nickname}', false),
                                                  ],
                                                  [
                                                    ('Seguemento',  (item.product?.type?.name == null ? '' : item.product!.type!.name), false),
                                                  ]
                                                  )
                                                ],
                                            ),
                                          ]
                                      );

                                    }
                                )
                            ),
                          ]
                      ),
                    ),
                  ),
                  // CustomStripedTableDisproportionateWidget(
                  //     columnNames: ['Nome', 'Quantidade'],
                  //     data: [
                  //       ['Fertilizante 25kg', '10', 'KG' ],
                  //       ['Fertilizante 25kg', '10', 'KG' ],
                  //       ['Fertilizante 25kg', '10', 'KG' ],
                  //       ['Fertilizante 25kg', '10', 'KG' ],
                  //     ],
                  //     maxHeight: 0.7* MediaQuery.of(context).size.height,
                  //     equalColumnProportions: true,
                  //     onTap: (index){},
                  //   ),
                  SizedBox(height: 10),
                  CustomInfoCardWidget(
                    infoCardType: InfoCardType.approvalType,
                    labelOne: 'Observação',
                    textOne: controller.purchaseRequest?.notes == null ? '' : controller.purchaseRequest!.notes!,
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
                                controller.cancelPurchaseRequestById(args.firstArgs);
                                CustomSnackBarWidget.show(SnackBarType.success, context, 'Solicitação ${args.firstArgs}/n cancelada com sucesso!');
                                pop();
                                ApprovalsListPage.navigate;
                              } catch (e) {
                                CustomSnackBarWidget.show(SnackBarType.error, context, 'Erro ao cancelar solicitação ${args.firstArgs}');
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
                                controller.approvePurchaseRequestById(args.firstArgs);
                                CustomSnackBarWidget.show(SnackBarType.success, context, 'Solicitação ${args.firstArgs}/n aprovada com sucesso!');
                                pop();
                                ApprovalsListPage.navigate;
                              } catch (e) {
                                CustomSnackBarWidget.show(SnackBarType.error, context, 'Erro ao aprovar solicitação ${args.firstArgs}');
                                return;
                              }
                            },
                            label: 'Aprovar',
                            backgroundColor: AppColors.primaryGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
        ));
  }
}
