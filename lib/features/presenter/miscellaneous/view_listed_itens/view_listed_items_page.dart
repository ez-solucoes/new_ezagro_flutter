import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/farm_plot_entity.dart';

import '../../../../consts/app_routes.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../domain/entities/company_entities/company_entity.dart';
import '../../../domain/entities/items_entities/items_entity.dart';
import '../../../domain/entities/select_entities/select_entity.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';
import '../../modules/purchase_request/purchase_request_create/purchase_request_create_delivery_page.dart';
import '../../modules/purchase_request/purchase_request_create/purchase_request_create_general_info_first_page.dart';
import '../../modules/purchase_request/purchase_request_create/purchase_request_create_list_items_page.dart';
import '../../modules/service_order/service_order_create/service_order_create_general_info_second_page.dart';
import '../../widgets/appbar/custom_appbar_widget.dart';
import '../../widgets/background/background_widget.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/cards/custom_product_expanded_card_widget.dart';
import '../../widgets/custom_tiles/custom_two_items_alternate_color_label_widget.dart';
import '../../widgets/custom_tiles/custom_two_items_alternate_color_tile_widget.dart';
import '../edit_listed_items/edit_listed_items_page.dart';
import '../item_selection_controller.dart';

class ViewListedItemsPage extends StatelessWidget {

  final ArgParams args;

  static const String routePath = AppRoutes.appViewListedItemsPage;

  static void navigate(ArgParams args) => Modular.to.navigate(routePath, arguments: args);

  static void push({required ArgParams args}) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();
  const ViewListedItemsPage({super.key, required this.args});


  @override
  Widget build(BuildContext context) {
    final ItemType currentItemType = args.firstArgs as ItemType;
    final ModuleFlux currentModuleFlux = args.secondArgs as ModuleFlux;
    final ItemSelectionController itemSelectionController = Modular.get<ItemSelectionController>();
    final PurchaseRequestCreateController createController = Modular.get<PurchaseRequestCreateController>();

    final String firstLabel;
    final String secondLabel;

    switch (currentItemType) {
      case ItemType.product:
        firstLabel = 'Nome';
        secondLabel = 'Quantidade';
        break;
      case ItemType.company:
        firstLabel = 'Nome da Empresa';
        secondLabel = 'CNPJ';
        break;
      case ItemType.agriculturalInput:
        firstLabel = 'Nome';
        secondLabel = 'Quantidade';
        break;
      case ItemType.plot:
        firstLabel = 'Talhão';
        secondLabel = 'Área (ha)';
    }

    return BackgroundWidget(
      scrollable: false,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: _getAppBarTitle(currentItemType),
        callback: () {
          if(currentModuleFlux == ModuleFlux.purchaseRequest){
            if (currentItemType == ItemType.product) {
              PurchaseRequestCreateGeneralInfoFirstPage.navigate();
            } else if (currentItemType == ItemType.agriculturalInput) {
              ViewListedItemsPage.push(args: ArgParams(firstArgs: ItemType.product, secondArgs: ModuleFlux.purchaseRequest));
            } else if (currentItemType == ItemType.company) {
              ViewListedItemsPage.push(args: ArgParams(firstArgs: ItemType.agriculturalInput, secondArgs: ModuleFlux.purchaseRequest));
            }
          } else if(currentModuleFlux == ModuleFlux.serviceOrder) {
            ServiceOrderCreateGeneralInfoSecondPage.navigate();
          }
        },
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Observer(builder: (context) {
          final bool isLoading;
          List finalItemsList = [];

          if (itemSelectionController.currentLoadedItemType == ItemType.product) {
            isLoading = itemSelectionController.isProductLoading;
            finalItemsList = itemSelectionController.finalRequestedProducts;
          } else if (itemSelectionController.currentLoadedItemType == ItemType.company) {
            isLoading = itemSelectionController.isCompanyLoading;
            finalItemsList = itemSelectionController.finalRequestedCompanies;
          } else if (itemSelectionController.currentLoadedItemType == ItemType.agriculturalInput) {
            isLoading = itemSelectionController.isAgriculturalInputLoading;
            finalItemsList = itemSelectionController.finalRequestedAgriculturalInputs;
          } else if(itemSelectionController.currentLoadedItemType == ItemType.plot){
            isLoading = itemSelectionController.isPlotLoading;
            finalItemsList = itemSelectionController.finalRequestedPlots;
          }else {
            isLoading = false;
          }

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    EditListedItemsPage.push(args: ArgParams(firstArgs: currentItemType, secondArgs: args.secondArgs));
                  },
                  child: Text(
                    _getAddItemsText(currentItemType),
                    style: AppTextStyles.underlinedTextButtonStyle(color: AppColors.primaryBlackColor),
                  ),
                ),
                const SizedBox(height: 10),
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
                      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTwoItemsAlternateColorLabelWidget(
                              firstLabel: firstLabel,
                              secondLabel: secondLabel,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: AppColors.borderWhiteColor),
                          Observer(builder: (context) {
                            if (finalItemsList.isNotEmpty) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: finalItemsList.length,
                                itemBuilder: (context, index) {
                                  final selectedItem = finalItemsList[index];

                                  if (currentItemType == ItemType.product && selectedItem is ItemsEntity) {
                                    final productItem = selectedItem;
                                    return Theme(
                                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        showTrailingIcon: false,
                                        tilePadding: const EdgeInsets.all(0),
                                        trailing: const SizedBox(width: 0.0),
                                        title: CustomTwoItemsAlternateColorTileWidget(
                                          itemType: currentItemType,
                                          index: index,
                                          firstItem: productItem.productName!,
                                          secondItem: productItem.requestedQuantity.toString(),
                                        ),
                                        children: [
                                          CustomProductExpandedCardWidget(
                                            index: index,
                                            itemType: currentItemType,
                                            canBeRemoved: true,
                                            onRemove: () => itemSelectionController.removeRequestedProduct(productItem.productId!),
                                            onEdit: () => EditListedItemsPage.push(args: ArgParams(firstArgs: currentItemType)),
                                            firstColumnData: const [
                                              {'title': 'Medida', 'conteudo': 'UN'},
                                              {'title': 'Marca', 'conteudo': 'Marca X'},
                                              {'title': 'Foto de anexo', 'conteudo': 'Foto'},
                                            ],
                                            secondColumnData: const [
                                              {'title': 'NCM', 'conteudo': '123.456.789'},
                                              {'title': 'Peso Bruto', 'conteudo': '10kg'},
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  } else if (currentItemType == ItemType.company && selectedItem is SelectEntity) {
                                    final companySelectEntity = selectedItem;
                                    final CompanyEntity? companyDetails = itemSelectionController.getCompanyDetails(companySelectEntity.value);

                                    final List<Map<String, String>> companyFirstColumnData = [
                                      {'title': 'CNPJ', 'conteudo': companyDetails?.legalDocumentNumber ?? 'N/A'},
                                      {'title': 'Estado', 'conteudo': companyDetails?.addressState ?? 'N/A'},
                                      {'title': 'Cidade', 'conteudo': companyDetails?.addressCity ?? 'N/A'},
                                    ];

                                    final List<Map<String, String>> companySecondColumnData = [
                                      {
                                        'title': 'Segmento',
                                        'conteudo': companyDetails?.segments?.isNotEmpty == true
                                            ? companyDetails!.segments!.first.name ?? 'N/A'
                                            : 'N/A'
                                      },
                                      {'title': 'Rua', 'conteudo': companyDetails?.addressStreet ?? 'N/A'},
                                      {'title': 'Número', 'conteudo': companyDetails?.addressNumber?.toString() ?? 'N/A'},
                                    ];

                                    return Theme(
                                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        showTrailingIcon: false,
                                        tilePadding: const EdgeInsets.all(0),
                                        trailing: const SizedBox(width: 0.0),
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
                                            canBeRemoved: true,
                                            onRemove: () => itemSelectionController.removeSelectedCompany(companySelectEntity.value),
                                            onEdit: () => EditListedItemsPage.push(args: ArgParams(firstArgs: currentItemType)),
                                            firstColumnData: companyFirstColumnData,
                                            secondColumnData: companySecondColumnData,
                                          ),
                                        ],
                                      ),
                                    );
                                  } else if (currentItemType == ItemType.agriculturalInput && selectedItem is ItemsEntity) {
                                    final agriculturalInputItem = selectedItem;
                                    return Theme(
                                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        showTrailingIcon: false,
                                        tilePadding: const EdgeInsets.all(0),
                                        trailing: const SizedBox(width: 0.0),
                                        title: CustomTwoItemsAlternateColorTileWidget(
                                          itemType: currentItemType,
                                          index: index,
                                          firstItem: agriculturalInputItem.productName!,
                                          secondItem: agriculturalInputItem.requestedQuantity.toString(),
                                        ),
                                        children: [
                                          CustomProductExpandedCardWidget(
                                            index: index,
                                            itemType: currentItemType,
                                            canBeRemoved: true,
                                            onRemove: () => itemSelectionController.removeRequestedAgriculturalInput(agriculturalInputItem.agriculturalInputId!),
                                            onEdit: () => EditListedItemsPage.push(args: ArgParams(firstArgs: currentItemType)),
                                            firstColumnData: const [
                                              {'title': 'Medida', 'conteudo': 'UN'},
                                              {'title': 'Classe', 'conteudo': 'Fertilizante'},
                                              {'title': 'Foto de anexo', 'conteudo': 'Foto'},
                                            ],
                                            secondColumnData: const [
                                              {'title': 'Marca', 'conteudo': 'AgroTech'},
                                              {'title': 'NCM', 'conteudo': '123.456.789'},
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }else if (currentItemType == ItemType.plot && selectedItem is FarmPlotEntity) {
                                    final plotItem = selectedItem;
                                    return Theme(
                                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        showTrailingIcon: false,
                                        tilePadding: const EdgeInsets.all(0),
                                        trailing: const SizedBox(width: 0.0),
                                        title: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: CustomTwoItemsAlternateColorTileWidget(
                                            itemType: currentItemType,
                                            index: index,
                                            firstItem: plotItem.number!,
                                            secondItem: '${plotItem.area.toString()} ha',
                                          ),
                                        ),
                                        children: [
                                          CustomProductExpandedCardWidget(
                                            index: index,
                                            itemType: currentItemType,
                                            onRemove: () => itemSelectionController.removeSelectedPlot(plotItem.id),
                                            onEdit: () => EditListedItemsPage.push(args: ArgParams(firstArgs: currentItemType)),
                                            firstColumnData: [
                                              {'title': 'Cultura', 'conteudo': '${plotItem.cropVariety?.crop?.name}'},
                                              plotItem.cropVariety?.technologyName != null ?
                                            {'title': 'Tecnologia', 'conteudo': plotItem.cropVariety?.technologyName}
                                              : {'title': 'Tecnologia', 'conteudo': 'N/A'},
                                            ],
                                            secondColumnData: [
                                              {'title': 'Variedade', 'conteudo': plotItem.cropVariety?.name},
                                            ],
                                            canBeRemoved: true,
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  // Se o item não corresponder ao tipo esperado para o currentItemType, retorna um Container vazio
                                  // ou você pode lançar um erro ou logar uma mensagem.
                                  return Container();
                                },
                              );
                            } else {
                              return Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  _getEmptyListMessage(currentItemType),
                                  style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                          }),
                        ],
                      ),
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
                            if(currentItemType == ItemType.product || currentItemType == ItemType.agriculturalInput){
                              PurchaseRequestCreateGeneralInfoFirstPage.navigate();
                            } else if(currentItemType == ItemType.company) {
                              if(createController.purchaseRequestType?.value == 1){
                                PurchaseRequestCreateListItemsPage.push(args: ArgParams(firstArgs: ItemType.product));
                              } else {
                                PurchaseRequestCreateListItemsPage.push(args: ArgParams(firstArgs: ItemType.agriculturalInput));
                              }
                            }
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
                                _getEmptySelectionMessage(currentItemType),
                              );
                            } else {
                              if (currentItemType == ItemType.product) {
                                createController.finalRequestedProducts = itemSelectionController.finalRequestedProducts;
                                PurchaseRequestCreateListItemsPage.push(args: ArgParams(firstArgs: ItemType.company, secondArgs: ModuleFlux.purchaseRequest));
                              } else if (currentItemType == ItemType.agriculturalInput) {
                                createController.finalRequestedAgriculturalInputs = itemSelectionController.finalRequestedAgriculturalInputs;
                                PurchaseRequestCreateListItemsPage.push(args: ArgParams(firstArgs: ItemType.company, secondArgs: ModuleFlux.purchaseRequest));
                              } else if (currentItemType == ItemType.company) {
                                createController.finalRequestedCompanies = itemSelectionController.finalRequestedCompanies;
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
      ),
    );
  }

  String _getAppBarTitle(ItemType type) {
    switch (type) {
      case ItemType.product:
        return 'Produtos da Requisição';
      case ItemType.company:
        return 'Empresas da Requisição';
      case ItemType.agriculturalInput:
        return 'Insumos da Requisição';
      case ItemType.plot:
        return 'Talhões';
    }
  }

  String _getAddItemsText(ItemType type) {
    switch (type) {
      case ItemType.product:
        return 'Adicionar Produtos';
      case ItemType.company:
        return 'Adicionar Empresas';
      case ItemType.agriculturalInput:
        return 'Adicionar Insumos';
      case ItemType.plot:
        return 'Adicionar Talhões';
    }
  }

  String _getEmptyListMessage(ItemType type) {
    switch (type) {
      case ItemType.product:
        return 'Nenhum produto selecionado para a requisição.';
      case ItemType.company:
        return 'Nenhuma empresa selecionada para a requisição.';
      case ItemType.agriculturalInput:
        return 'Nenhum insumo selecionado para a requisição.';
      case ItemType.plot:
        return 'Nenhum talhão selecionado para a requisição.';
    }
  }

  String _getEmptySelectionMessage(ItemType type) {
    switch (type) {
      case ItemType.product:
        return 'Selecione pelo menos um produto.';
      case ItemType.company:
        return 'Selecione pelo menos uma empresa.';
      case ItemType.agriculturalInput:
        return 'Selecione pelo menos um insumo.';
      case ItemType.plot:
        return 'Selecione pelo menos um talhão.';
    }
  }

  // Map<String, String> _getLabels(ItemType type) {
  //   switch (type) {
  //     case ItemType.product:
  //     case ItemType.agriculturalInput:
  //       return {'first': 'Nome', 'second': 'Quantidade'};
  //     case ItemType.company:
  //       return {'first': 'Nome da Empresa', 'second': 'CNPJ'};
  //     case ItemType.plot:
  //       return {'first': 'Talhão', 'second': 'Área (ha)'};
  //   }
  // }
  //
  // bool _shouldShowQuantityControls(ItemType type) {
  //   return type == ItemType.product || type == ItemType.agriculturalInput;
  // }

}
