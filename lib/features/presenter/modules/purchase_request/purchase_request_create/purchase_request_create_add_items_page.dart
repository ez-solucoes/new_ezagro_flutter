import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_floating_action_button_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/filter_bottom_sheet/filter_companies_bottom_sheet_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../domain/entities/items_entities/items_entity.dart';
import '../../../miscellaneous/item_selection_controller.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_edit_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_label_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_selectable_tile_widget.dart';
import '../../../widgets/filter_bottom_sheet/filter_products_bottom_sheet_widget.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../../domain/entities/company_entities/company_entity.dart';
import '../../../widgets/filter_bottom_sheet/filter_agricultural_input_bottom_sheet_widget.dart';

class PurchaseRequestCreateAddItemsPage extends StatefulWidget {
  final ArgParams args;

  static const String routePath = AppRoutes.addPurchaseRequestCreateAddItemsPage;

  static void push({required ArgParams args}) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop(); // Considere pop com retorno de dados aqui se necessário

  const PurchaseRequestCreateAddItemsPage({super.key, required this.args});

  @override
  State<PurchaseRequestCreateAddItemsPage> createState() => _PurchaseRequestCreateAddItemsPageState();
}

class _PurchaseRequestCreateAddItemsPageState extends State<PurchaseRequestCreateAddItemsPage> {
  final ItemSelectionController itemSelectionController = Modular.get<ItemSelectionController>();
  final TextEditingController _autocompleteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final ItemType currentItemType = widget.args.firstArgs as ItemType;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemSelectionController.loadItems(currentItemType);
      // Sincroniza o controller do Autocomplete com o searchQuery ao iniciar
      _autocompleteController.text = itemSelectionController.searchQuery;
    });
  }

  @override
  void dispose() {
    _autocompleteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ItemType currentItemType = widget.args.firstArgs as ItemType;

    final String firstLabel;
    final String secondLabel;

    switch (currentItemType) {
      case ItemType.product:
        firstLabel = 'Nome';
        secondLabel = 'Quantidade';
        break;
      case ItemType.company:
        firstLabel = 'Nome';
        secondLabel = 'CNPJ';
        break;
      case ItemType.agriculturalInput:
        firstLabel = 'Nome';
        secondLabel = 'Quantidade';
        break;
    }

    return BackgroundWidget(
      scrollable: true,
      floatButton: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFloatingActionButtonWidget(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        if (currentItemType == ItemType.company) {
                          return FilterCompaniesBottomSheetWidget(
                              controller: itemSelectionController);
                        } else if (currentItemType == ItemType.product) {
                          return FilterProductsBottomSheetWidget(
                              controller: itemSelectionController);
                        } else if (currentItemType == ItemType.agriculturalInput) {
                          return FilterAgriculturalInputBottomSheetWidget(
                              controller: itemSelectionController);
                        }
                        return Container();
                      },
                    );
                  },
                  backgroundColor: AppColors.primaryWhiteColor,
                  icon: Icons.filter_alt_outlined,
                  iconColor: AppColors.primaryBlackColor,
                  heroTag: 'filter_${currentItemType.name}_button',
                ),
                CustomFloatingActionButtonWidget(
                  onPressed: () => PurchaseRequestCreateAddItemsPage.pop(),
                  backgroundColor: AppColors.primaryGreenColor,
                  icon: Icons.check,
                  iconColor: AppColors.primaryWhiteColor,
                  heroTag: 'check_${currentItemType.name}_button',
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: _getAppBarTitle(currentItemType),
        callback: () => PurchaseRequestCreateAddItemsPage.pop(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Observer(
          builder: (context) {
            final bool isLoading;
            List itemsList = [];

            if (itemSelectionController.currentLoadedItemType == ItemType.product) {
              isLoading = itemSelectionController.isProductLoading;
              itemsList = itemSelectionController.filteredAddItemsList;
            } else if (itemSelectionController.currentLoadedItemType == ItemType.company) {
              isLoading = itemSelectionController.isCompanyLoading;
              itemsList = itemSelectionController.filteredAddItemsList;
            } else if (itemSelectionController.currentLoadedItemType == ItemType.agriculturalInput) {
              isLoading = itemSelectionController.isAgriculturalInputLoading;
              itemsList = itemSelectionController.filteredAddItemsList;
            } else {
              isLoading = false;
            }

            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  Autocomplete<String>(
                    fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                      fieldTextEditingController.text = itemSelectionController.searchQuery;
                      return TextField(
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                        decoration: InputDecoration(
                          hintText: _getSearchHint(currentItemType),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: AppColors.formGreyColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: AppColors.formGreyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: AppColors.primaryGreenColor, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        ),
                        onChanged: (text) {
                          itemSelectionController.updateSearchQuery(text);
                        },
                        onSubmitted: (String value) {
                          onFieldSubmitted();
                        },
                      );
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }

                      List<SelectEntity> sourceList;
                      if (currentItemType == ItemType.product) {
                        sourceList = itemSelectionController.allProducts;
                      } else if (currentItemType == ItemType.company) {
                        sourceList = itemSelectionController.allCompaniesToSelect;
                      } else {
                        sourceList = itemSelectionController.allAgriculturalInputs;
                      }

                      return sourceList
                          .where((item) => item.label != null && item.label!.toLowerCase().contains(textEditingValue.text.toLowerCase()))
                          .map((item) => item.label!);
                    },
                    onSelected: (String selection) {
                      debugPrint('Sugestão selecionada: $selection');
                      itemSelectionController.updateSearchQuery(selection);
                    },
                    optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4.0,
                          child: SizedBox(
                            height: 200.0,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final String option = options.elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(option),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),

                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
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
                          CustomTwoItemsAlternateColorLabelWidget(
                            firstLabel: firstLabel,
                            secondLabel: secondLabel,
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: AppColors.borderWhiteColor),
                          Observer(builder: (context) {
                            if (itemsList.isNotEmpty) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: itemsList.length,
                                itemBuilder: (context, index) {
                                  final item = itemsList[index];

                                  // --- VERIFICAÇÃO DE TIPO COM 'is' ANTES DO USO ---
                                  if (currentItemType == ItemType.product && item is ItemsEntity) {
                                    final productItem = item; // Smart cast automático após 'is'
                                    return Theme(
                                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        showTrailingIcon: false,
                                        tilePadding: const EdgeInsets.all(0),
                                        trailing: const SizedBox(width: 0.0),
                                        title: CustomTwoItemsAlternateColorEditWidget(
                                          index: index,
                                          firstItem: productItem.productName!,
                                          secondItem: productItem.requestedQuantity.toString(),
                                          addQuantity: () => itemSelectionController.incrementRequestedProductQuantity(productItem.productId!),
                                          removeQuantity: () => itemSelectionController.decrementRequestedProductQuantity(productItem.productId!),
                                        ),
                                      ),
                                    );
                                  } else if (currentItemType == ItemType.company && item is SelectEntity) { // LINHA 308
                                    final companySelectEntity = item; // Smart cast automático após 'is'
                                    final CompanyEntity? companyDetails = itemSelectionController.getCompanyDetails(companySelectEntity.value);

                                    return Theme(
                                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        showTrailingIcon: false,
                                        tilePadding: const EdgeInsets.all(0),
                                        trailing: const SizedBox(width: 0.0),
                                        title: CustomTwoItemsAlternateColorSelectableTileWidget(
                                          firstLabel: companySelectEntity.label ?? 'Nome da Empresa',
                                          secondLabel: companyDetails?.legalDocumentNumber ?? 'N/A',
                                          initialIsSelected: itemSelectionController.isCompanySelected(companySelectEntity.value),
                                          onChanged: (isSelected) {
                                            itemSelectionController.toggleCompanySelection(companySelectEntity.value, isSelected);
                                          },
                                        ),
                                      ),
                                    );
                                  } else if (currentItemType == ItemType.agriculturalInput && item is ItemsEntity) {
                                    final agriculturalInputItem = item; // Smart cast automático após 'is'
                                    return Theme(
                                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        showTrailingIcon: false,
                                        tilePadding: const EdgeInsets.all(0),
                                        trailing: const SizedBox(width: 0.0),
                                        title: CustomTwoItemsAlternateColorEditWidget(
                                          index: index,
                                          firstItem: agriculturalInputItem.productName!,
                                          secondItem: agriculturalInputItem.requestedQuantity.toString(),
                                          addQuantity: () => itemSelectionController.incrementRequestedAgriculturalInputQuantity(agriculturalInputItem.productId!),
                                          removeQuantity: () => itemSelectionController.decrementRequestedAgriculturalInputQuantity(agriculturalInputItem.productId!),
                                        ),
                                      ),
                                    );
                                  }
                                  // Retorna um Container vazio para tipos que não correspondem ao currentItemType,
                                  // ou onde o cast falharia.
                                  return Container();
                                },
                              );
                            } else {
                              return Padding(
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
                ],
              );
            }
          },
        ),
      ),
    );
  }

  String _getAppBarTitle(ItemType type) {
    switch (type) {
      case ItemType.product:
        return AppStringsPortuguese.newPurchaseRequestString;
      case ItemType.company:
        return 'Adicionar Empresas';
      case ItemType.agriculturalInput:
        return 'Adicionar Insumos';
      default:
        return 'Adicionar Itens';
    }
  }

  String _getSearchHint(ItemType type) {
    switch (type) {
      case ItemType.product:
        return 'Buscar produto...';
      case ItemType.company:
        return 'Buscar empresa...';
      case ItemType.agriculturalInput:
        return 'Buscar insumo...';
      default:
        return 'Buscar...';
    }
  }

  String _getEmptyListMessage(ItemType type) {
    switch (type) {
      case ItemType.product:
        return 'Nenhum produto encontrado.';
      case ItemType.company:
        return 'Nenhuma empresa encontrada.';
      case ItemType.agriculturalInput:
        return 'Nenhum insumo encontrado.';
      default:
        return 'Nenhum item encontrado.';
    }
  }
}