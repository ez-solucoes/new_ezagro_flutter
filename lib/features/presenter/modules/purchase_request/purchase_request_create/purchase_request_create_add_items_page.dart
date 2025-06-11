import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_floating_action_button_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/filter_bottom_sheet/filter_companies_bottom_sheet_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../domain/entities/items_entities/items_entity.dart';
import '../../../miscellaneous/item_selection_controller.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_edit_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_label_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_selectable_tile_widget.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../../domain/entities/company_entities/company_entity.dart';
import '../../../widgets/filter_bottom_sheet/filter_agricultural_input_bottom_sheet_widget.dart';
import '../../../widgets/filter_bottom_sheet/filter_products_bottom_sheet_widget.dart';

class PurchaseRequestCreateAddItemsPage extends StatefulWidget {
  final ArgParams args;

  static const String routePath = AppRoutes.addPurchaseRequestCreateAddItemsPage;

  static void push({required ArgParams args}) =>
      Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();

  const PurchaseRequestCreateAddItemsPage({super.key, required this.args});

  @override
  State<PurchaseRequestCreateAddItemsPage> createState() =>
      _PurchaseRequestCreateAddItemsPageState();
}

class _PurchaseRequestCreateAddItemsPageState
    extends State<PurchaseRequestCreateAddItemsPage> {
  final ItemSelectionController itemSelectionController =
  Modular.get<ItemSelectionController>();
  final TextEditingController _autocompleteSearchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    final ItemType currentItemType = widget.args.firstArgs as ItemType;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemSelectionController.loadItems(currentItemType);
      _autocompleteSearchController.text = itemSelectionController.searchQuery;
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _autocompleteSearchController.dispose();
    super.dispose();
  }

  String _getAppBarTitle(ItemType type) {
    switch (type) {
      case ItemType.product:
        return AppStringsPortuguese.newPurchaseRequestString;
      case ItemType.company:
        return 'Adicionar Empresas';
      case ItemType.agriculturalInput:
        return 'Adicionar Insumos';
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
    }
  }

  String _getEmptyListMessage(ItemType type) {
    switch (type) {
      case ItemType.product:
        return 'Nenhum produto encontrado. Verifique os filtros ou a busca.';
      case ItemType.company:
        return 'Nenhuma empresa encontrada. Verifique os filtros ou a busca.';
      case ItemType.agriculturalInput:
        return 'Nenhum insumo encontrado. Verifique os filtros ou a busca.';
    }
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
      scrollable: false,
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
                  onPressed: () {
                    List<dynamic> selectedItems;
                    if (currentItemType == ItemType.product) {
                      selectedItems = itemSelectionController.finalRequestedProducts;
                    } else if (currentItemType == ItemType.company) {
                      selectedItems = itemSelectionController.finalRequestedCompanies;
                    } else {
                      selectedItems =
                          itemSelectionController.finalRequestedAgriculturalInputs;
                    }
                    Modular.to.pop(selectedItems);
                  },
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
            final bool isLoadingInitialData = itemSelectionController.isFirstLoading ||
                (currentItemType == ItemType.product &&
                    itemSelectionController.isProductLoading) ||
                (currentItemType == ItemType.company &&
                    itemSelectionController.isCompanyLoading) ||
                (currentItemType == ItemType.agriculturalInput &&
                    itemSelectionController.isAgriculturalInputLoading &&
                    itemSelectionController.agriculturalInputCurrentPage == 1);

            if (isLoadingInitialData) {
              return const Center(child: CircularProgressIndicator());
            }

            final List itemsList = itemSelectionController.filteredAddItemsList;

            return Column(
              children: [
                Autocomplete<String>(
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    if (fieldTextEditingController.text !=
                        itemSelectionController.searchQuery) {
                      fieldTextEditingController.text =
                          itemSelectionController.searchQuery;
                      fieldTextEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: fieldTextEditingController.text.length),
                      );
                    }

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
                          borderSide: const BorderSide(
                              color: AppColors.primaryGreenColor, width: 2),
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      ),
                      onChanged: (text) {
                        if (_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce = Timer(const Duration(milliseconds: 500), () {
                          if (text.length >= 3 || text.isEmpty) {
                            itemSelectionController.updateSearchQuery(text);
                          } else if (text.length < 3 && itemSelectionController.searchQuery.isNotEmpty) {
                            itemSelectionController.updateSearchQuery('');
                          }
                        });
                      },
                      onSubmitted: (String value) {
                        onFieldSubmitted();
                        _debounce?.cancel();
                        if (value.length >= 3 || value.isEmpty) {
                          itemSelectionController.updateSearchQuery(value);
                        } else if (value.length < 3 && itemSelectionController.searchQuery.isNotEmpty) {
                          itemSelectionController.updateSearchQuery('');
                        }
                      },
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.length < 3) {
                      return const Iterable<String>.empty();
                    }

                    List<SelectEntity> sourceListForAutocomplete;
                    if (currentItemType == ItemType.product) {
                      sourceListForAutocomplete = itemSelectionController.allProducts;
                    } else if (currentItemType == ItemType.company) {
                      sourceListForAutocomplete =
                          itemSelectionController.allCompaniesToSelect;
                    } else {
                      sourceListForAutocomplete =
                          itemSelectionController.agriculturalInputListToSelect;
                    }

                    return sourceListForAutocomplete
                        .where((item) =>
                    item.label != null &&
                        item.label!
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()))
                        .map((item) => item.label!);
                  },
                  onSelected: (String selection) {
                    _autocompleteSearchController.text = selection;
                    itemSelectionController.updateSearchQuery(selection);
                    FocusScope.of(context).unfocus();
                  },
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<String> onSelected,
                      Iterable<String> options) {
                    return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4.0,
                          child: SizedBox(
                            height: options.isNotEmpty
                                ? (options.length > 4 ? 200.0 : options.length * 50.0)
                                : 0,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final String option = options.elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    onSelected(option);
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(option),
                                  ),
                                );
                              },
                            ),
                          ),
                        ));
                  },
                ),
                const SizedBox(height: 10),
                Expanded(
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
                          CustomTwoItemsAlternateColorLabelWidget(
                            firstLabel: firstLabel,
                            secondLabel: secondLabel,
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: AppColors.borderWhiteColor),
                          Observer(builder: (context) {
                            if (itemsList.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  _getEmptyListMessage(currentItemType),
                                  style: AppTextStyles.cardBodyTextStyle(
                                      color: AppColors.primaryBlackColor),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }

                            return Expanded(
                              child: ListView.builder(
                                controller: currentItemType == ItemType.agriculturalInput
                                    ? itemSelectionController.scrollController
                                    : null,
                                shrinkWrap: true,
                                physics: currentItemType == ItemType.agriculturalInput
                                    ? null
                                    : const NeverScrollableScrollPhysics(),
                                itemCount: itemsList.length +
                                    (currentItemType == ItemType.agriculturalInput &&
                                        itemSelectionController
                                            .isAgriculturalInputLoadingMore
                                        ? 1
                                        : 0),
                                itemBuilder: (context, index) {
                                  if (index == itemsList.length &&
                                      currentItemType == ItemType.agriculturalInput &&
                                      itemSelectionController
                                          .isAgriculturalInputLoadingMore) {
                                    return const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: CircularProgressIndicator(),
                                        ));
                                  }

                                  final item = itemsList[index];

                                  if (currentItemType == ItemType.product) {
                                    if (item is ItemsEntity) {
                                      final productItem = item;
                                      return Theme(
                                        data: Theme.of(context)
                                            .copyWith(dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          initiallyExpanded: false,
                                          showTrailingIcon: false,
                                          tilePadding: const EdgeInsets.all(0),
                                          trailing: const SizedBox(width: 0.0),
                                          title: CustomTwoItemsAlternateColorEditWidget(
                                            index: index,
                                            firstItem: productItem.productName!,
                                            secondItem:
                                            productItem.requestedQuantity.toString(),
                                            addQuantity: () => itemSelectionController
                                                .incrementRequestedProductQuantity(
                                                productItem.productId!),
                                            removeQuantity: () => itemSelectionController
                                                .decrementRequestedProductQuantity(
                                                productItem.productId!),
                                          ),
                                        ),
                                      );
                                    }
                                  } else if (currentItemType == ItemType.company) {
                                    if (item is SelectEntity) {
                                      final companySelectEntity = item;
                                      final CompanyEntity? companyDetails =
                                      itemSelectionController.getCompanyDetails(
                                          companySelectEntity.value);

                                      return Theme(
                                        data: Theme.of(context)
                                            .copyWith(dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          initiallyExpanded: false,
                                          showTrailingIcon: false,
                                          tilePadding: const EdgeInsets.all(0),
                                          trailing: const SizedBox(width: 0.0),
                                          title:
                                          CustomTwoItemsAlternateColorSelectableTileWidget(
                                            firstLabel: companySelectEntity.label ??
                                                'Nome da Empresa',
                                            secondLabel:
                                            companyDetails?.legalDocumentNumber ??
                                                'N/A',
                                            initialIsSelected:
                                            itemSelectionController.isCompanySelected(
                                                companySelectEntity.value),
                                            onChanged: (isSelected) {
                                              itemSelectionController
                                                  .toggleCompanySelection(
                                                  companySelectEntity.value,
                                                  isSelected);
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  } else if (currentItemType ==
                                      ItemType.agriculturalInput) {
                                    if (item is ItemsEntity) {
                                      final agriculturalInputItem = item;
                                      return Theme(
                                        data: Theme.of(context)
                                            .copyWith(dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          initiallyExpanded: false,
                                          showTrailingIcon: false,
                                          tilePadding: const EdgeInsets.all(0),
                                          trailing: const SizedBox(width: 0.0),
                                          title: CustomTwoItemsAlternateColorEditWidget(
                                            index: index,
                                            firstItem: agriculturalInputItem.productName!,
                                            secondItem: agriculturalInputItem
                                                .requestedQuantity
                                                .toString(),
                                            addQuantity: () {
                                              final int? agriculturalInputId = agriculturalInputItem.agriculturalInputId;
                                              if (agriculturalInputId != null) {
                                                itemSelectionController.incrementRequestedAgriculturalInputQuantity(agriculturalInputId);
                                              } else {
                                                debugPrint('Erro: ID do insumo agrícola é nulo.');
                                              }
                                            },
                                            removeQuantity: () {
                                              final int? agriculturalInputId = agriculturalInputItem.agriculturalInputId;
                                              if (agriculturalInputId != null) {
                                                itemSelectionController.decrementRequestedAgriculturalInputQuantity(agriculturalInputId);
                                              } else {
                                                debugPrint('Erro: ID do insumo agrícola é nulo.');
                                              }
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                  return Container();
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}