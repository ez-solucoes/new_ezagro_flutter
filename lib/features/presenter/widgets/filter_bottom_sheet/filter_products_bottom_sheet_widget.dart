import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Importar Observer para reagir a mudanças na controller

import '../../../../design_system/colors/app_colors.dart';
import '../../../domain/entities/select_entities/select_entity.dart';
import '../../miscellaneous/item_selection_controller.dart';
import '../buttons/custom_elevated_button.dart';

class FilterProductsBottomSheetWidget extends StatefulWidget {
  // REMOVIDO: final List<SelectEntity> productTypesList;
  // NOVO: Recebe a ItemSelectionController diretamente
  final ItemSelectionController controller;

  const FilterProductsBottomSheetWidget({super.key, required this.controller});

  @override
  State<FilterProductsBottomSheetWidget> createState() => _FilterProductsBottomSheetWidgetState();
}

class _FilterProductsBottomSheetWidgetState extends State<FilterProductsBottomSheetWidget> {
  final Set<int> selectedProductTypes = {};
  // A controller agora é acessada via widget.controller
  // final controller = Modular.get<PurchaseRequestCreateController>(); // REMOVIDO

  @override
  void initState() {
    super.initState();
    // Inicializa o estado local com as seleções atuais da controller
    selectedProductTypes.addAll(widget.controller.filteredProductTypeListToSelect.map((s) => s.value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration( // Adicionado const
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adicionado para BottomSheet
            children: [
              Row(
                children: [
                  const Icon(Icons.filter_alt_outlined), // Adicionado const
                  const SizedBox(width: 10), // Adicionado const
                  Text(
                    'Filtrar por',
                    style: TextStyle(color: AppColors.formGreyColor, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Adicionado const
              Row(
                children: [
                  Text(
                    'Segmento:', // Ou "Tipo de Produto:" se for mais preciso
                    style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Adicionado const
              // REMOVIDO: Expanded
              Observer( // Adicionado Observer para reagir a mudanças na lista de tipos da controller
                builder: (_) {
                  // Usar a lista de tipos de produto da controller para as opções
                  final List<SelectEntity> productTypes = widget.controller.productTypesListToSelect;
          
                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: productTypes.map((productType) { // Usa a lista da controller
                        final isSelected = selectedProductTypes.contains(productType.value);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedProductTypes.remove(productType.value);
                              } else {
                                selectedProductTypes.add(productType.value);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Adicionado const
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primaryGreenColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: AppColors.formGreyColor, width: 1),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  productType.label ?? 'Sem Label',
                                  style: TextStyle(
                                    color: isSelected ? AppColors.primaryWhiteColor : AppColors.primaryBlackColor,
                                  ),
                                ),
                                if (isSelected) ...[
                                  const SizedBox(width: 5), // Adicionado const
                                  const Icon( // Adicionado const
                                    Icons.close,
                                    color: AppColors.primaryWhiteColor,
                                    size: 18,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0), // Adicionado const
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedProductTypes.clear();
                            widget.controller.clearSelectedProductTypes(); // USA widget.controller
                          });
                        },
                        label: 'Limpar Filtros',
                        textColor: AppColors.primaryBlackColor,
                        backgroundColor: AppColors.backgroundColor,
                        borderColor: AppColors.formGreyColor,
                      ),
                    ),
                    const SizedBox(width: 30), // Adicionado const
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {
                          widget.controller.updateSelectedProductTypes(selectedProductTypes); // USA widget.controller
                          Navigator.pop(context);
                        },
                        label: 'Aplicar',
                        backgroundColor: AppColors.primaryGreenColor,
                        borderColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}