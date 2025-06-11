import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Importar Observer para reagir a mudanças na controller


import '../../../../design_system/colors/app_colors.dart';
import '../../../domain/entities/select_entities/select_entity.dart'; // Para SelectEntity
import '../../miscellaneous/item_selection_controller.dart';
import '../buttons/custom_elevated_button.dart';

class FilterAgriculturalInputBottomSheetWidget extends StatefulWidget {
  // NOVO: Recebe a ItemSelectionController diretamente
  final ItemSelectionController controller;

  const FilterAgriculturalInputBottomSheetWidget({super.key, required this.controller});

  @override
  State<FilterAgriculturalInputBottomSheetWidget> createState() => _FilterAgriculturalInputBottomSheetWidgetState();
}

class _FilterAgriculturalInputBottomSheetWidgetState extends State<FilterAgriculturalInputBottomSheetWidget> {
  // Estado local para as seleções de classes de insumos
  final Set<int> selectedAgriculturalInputClasses = {};

  @override
  void initState() {
    super.initState();
    // Inicializa o estado local com as seleções atuais da controller
    selectedAgriculturalInputClasses.addAll(widget.controller.filteredAgriculturalInputClassesListToSelect.map((s) => s.value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Importante para BottomSheet
          crossAxisAlignment: CrossAxisAlignment.start, // Alinhar conteúdo à esquerda
          children: [
            Row(
              children: [
                const Icon(Icons.filter_alt_outlined),
                const SizedBox(width: 10),
                Text(
                  'Filtrar por',
                  style: TextStyle(color: AppColors.formGreyColor, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Classe de Insumo:', // Rótulo específico para insumos
              style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Observer( // Adicionado Observer para reagir a mudanças na lista de classes da controller
              builder: (_) {
                // Usa a lista de classes de insumos da controller para as opções
                final List<SelectEntity> agriculturalInputClasses = widget.controller.agriculturalInputClassesListToSelect;

                return SingleChildScrollView(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: agriculturalInputClasses.map((inputClass) { // Usa a lista da controller
                      final isSelected = selectedAgriculturalInputClasses.contains(inputClass.value);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedAgriculturalInputClasses.remove(inputClass.value);
                            } else {
                              selectedAgriculturalInputClasses.add(inputClass.value);
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primaryGreenColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: AppColors.formGreyColor, width: 1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                inputClass.label ?? 'Sem Label',
                                style: TextStyle(
                                  color: isSelected ? AppColors.primaryWhiteColor : AppColors.primaryBlackColor,
                                ),
                              ),
                              if (isSelected) ...[
                                const SizedBox(width: 5),
                                const Icon(
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedAgriculturalInputClasses.clear();
                          widget.controller.clearSelectedAgriculturalInputClasses(); // USA widget.controller
                        });
                      },
                      label: 'Limpar Filtros',
                      textColor: AppColors.primaryBlackColor,
                      backgroundColor: AppColors.backgroundColor,
                      borderColor: AppColors.formGreyColor,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                        widget.controller.updateSelectedAgriculturalInputClasses(selectedAgriculturalInputClasses); // USA widget.controller
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
    );
  }
}