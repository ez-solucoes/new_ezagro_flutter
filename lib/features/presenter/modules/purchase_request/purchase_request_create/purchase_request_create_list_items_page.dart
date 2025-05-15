import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_add_items_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_delivery_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_general_info_first_page.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/entities/items_entities/items_entity.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../../domain/entities/company_entities/company_entity.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/cards/custom_product_expanded_card_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_label_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_tile_widget.dart';
import '../purchase_request_list/purchase_request_list_page.dart';

class PurchaseRequestCreateListItemsPage extends StatelessWidget {
  final ArgParams args;
  static const String routePath = AppRoutes.appPurchaseRequestCreateListItemsPage;

  static void navigate() => Modular.to.navigate(routePath);

  static void push({required ArgParams args}) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();

  const PurchaseRequestCreateListItemsPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final ItemType currentItemType = args.firstArgs;
    final controller = Modular.get<PurchaseRequestCreateController>();

    final String firstLabel = currentItemType == ItemType.product ? 'Nome' : 'Nome da Empresa';
    final String secondLabel = currentItemType == ItemType.product ? 'Quantidade' : 'CNPJ';

    return BackgroundWidget(
        scrollable: false,
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStringsPortuguese.newPurchaseRequestString,
          callback: () => PurchaseRequestListPage.navigate(),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Observer(builder: (context) {
            final bool isLoading =
                currentItemType == ItemType.product ? controller.isProductLoading : controller.isCompanyLoading;

            if (isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              final List finalItemsList = currentItemType == ItemType.product
                  ? controller.finalRequestedProducts
                  : controller.finalRequestedCompanies;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      PurchaseRequestCreateAddItemsPage.push(args: ArgParams(firstArgs: currentItemType));
                    },
                    child: Text(
                      currentItemType == ItemType.product ? 'Adicionar Produtos' : 'Adicionar Empresas',
                      style: AppTextStyles.underlinedTextButtonStyle(color: AppColors.primaryBlackColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
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
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                          child: Column(
                            children: [
                              CustomTwoItemsAlternateColorLabelWidget(
                                firstLabel: firstLabel,
                                secondLabel: secondLabel,
                              ),
                              SizedBox(height: 10),
                              Divider(color: AppColors.borderWhiteColor),
                              Observer(builder: (context) {
                                if (finalItemsList.isNotEmpty) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: finalItemsList.length,
                                    itemBuilder: (context, index) {
                                      final selectedItem = finalItemsList[index];

                                      if (currentItemType == ItemType.product) {
                                        final productItem = selectedItem as ItemsEntity;
                                        return Theme(
                                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                          child: ExpansionTile(
                                            initiallyExpanded: false,
                                            showTrailingIcon: false,
                                            tilePadding: const EdgeInsets.all(0),
                                            trailing: SizedBox(width: 0.0),
                                            title: CustomTwoItemsAlternateColorTileWidget(
                                                itemType: currentItemType,
                                                index: index,
                                                firstItem: productItem.productName!,
                                                secondItem: productItem.requestedQuantity.toString()),
                                            children: [
                                              CustomProductExpandedCardWidget(
                                                index: index,
                                                itemType: currentItemType,
                                                // Passa o tipo de item
                                                onRemove: () =>
                                                    controller.removeRequestedProduct(productItem.productId),
                                                // Callback Remover Produto
                                                onEdit: () {
                                                  debugPrint('Editar Produto: ${productItem.productName}');
                                                },
                                                firstColumnData: [
                                                  {'title': 'Medida', 'conteudo': 'KG'},
                                                  {'title': 'Segmento', 'conteudo': 'Fertilizantes'},
                                                  {'title': 'Foto de anexo', 'conteudo': 'Foto'},
                                                ],
                                                secondColumnData: [
                                                  {'title': 'Marca', 'conteudo': 'Heringer'},
                                                  {'title': 'Maquinário vinculado', 'conteudo': 'Maquinário'},
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      } else if (currentItemType == ItemType.company) {
                                        final companySelectEntity =
                                            selectedItem as SelectEntity; // Cast para SelectEntity

                                        final CompanyEntity? companyDetails =
                                            controller.getCompanyDetails(companySelectEntity.value);

                                        final List<Map<String, String>> companyFirstColumnData = [];
                                        final List<Map<String, String>> companySecondColumnData = [];

                                        if (companyDetails != null) {
                                          companyFirstColumnData.addAll([
                                            {'title': 'Nome', 'conteudo': companyDetails.name ?? 'N/A'},
                                            {
                                              'title': 'Endereço',
                                              'conteudo':
                                                  '${companyDetails.addressStreet ?? ''} - ${companyDetails.addressNumber ?? ''}'
                                            },
                                            {'title': 'Cidade', 'conteudo': companyDetails.addressCity ?? 'N/A'},
                                          ]);
                                          companySecondColumnData.addAll([
                                            {
                                              'title': 'Segmento',
                                              'conteudo': controller.getCompanySegmentName(companyDetails.id)
                                            },
                                            {
                                              'title': 'Bairro',
                                              'conteudo': companyDetails.addressNeighborhood ?? 'N/A'
                                            },
                                            // CNPJ já está no tile, mas pode ser repetido aqui se necessário
                                            // {'title': 'CNPJ', 'conteudo': companyDetails.legalDocumentNumber ?? 'N/A'},
                                          ]);
                                          // Adicione outros campos da CompanyEntity conforme necessário
                                        } else {
                                          // Caso os detalhes da empresa não sejam encontrados
                                          companyFirstColumnData.add({
                                            'title': 'Detalhes',
                                            'conteudo': 'Detalhes da empresa não encontrados.'
                                          });
                                        }

                                        return Theme(
                                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                          child: ExpansionTile(
                                            initiallyExpanded: false,
                                            showTrailingIcon: false,
                                            tilePadding: const EdgeInsets.all(0),
                                            trailing: SizedBox(width: 0.0),
                                            title: CustomTwoItemsAlternateColorTileWidget(
                                              itemType: currentItemType,
                                              index: index,
                                              firstItem: companySelectEntity.label ?? 'Nome da Empresa',
                                              secondItem: companyDetails?.legalDocumentNumber ?? 'N/A',
                                            ),
                                            children: [
                                              CustomProductExpandedCardWidget(
                                                index: index,
                                                itemType: currentItemType,
                                                onRemove: () =>
                                                    controller.removeSelectedCompany(companySelectEntity.value),
                                                onEdit: null,
                                                firstColumnData: companyFirstColumnData,
                                                secondColumnData: companySecondColumnData,
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                      return Container(); // Fallback
                                    },
                                  );
                                } else {
                                  return Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                                    child: Text(
                                      currentItemType == ItemType.product
                                          ? 'Nenhum produto selecionado para a requisição.'
                                          : 'Nenhuma empresa selecionada para a requisição.',
                                      style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                              PurchaseRequestCreateGeneralInfoFirstPage.pop();
                              // controller.resetState(); // Se voltar significa cancelar a criação atual
                            },
                            label: 'Voltar',
                            textColor: AppColors.primaryBlackColor,
                            backgroundColor: AppColors.backgroundColor,
                            borderColor: AppColors.formGreyColor,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                              if (finalItemsList.isEmpty) {
                                CustomSnackBarWidget.show(
                                  SnackBarType.alert,
                                  context,
                                  currentItemType == ItemType.product
                                      ? 'Selecione pelo menos um produto.'
                                      : 'Selecione pelo menos uma empresa.',
                                );
                              } else {
                                if (currentItemType == ItemType.product) {
                                  PurchaseRequestCreateListItemsPage.push(args: ArgParams(firstArgs: ItemType.company));
                                } else {
                                  PurchaseRequestCreateDeliveryPage.push();
                                }
                              }
                            },
                            label: 'Próximo',
                            backgroundColor: AppColors.primaryGreenColor,
                            borderColor: Colors.transparent,
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
