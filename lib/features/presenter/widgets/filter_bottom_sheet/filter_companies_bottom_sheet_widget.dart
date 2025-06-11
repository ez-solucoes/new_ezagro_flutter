import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../miscellaneous/item_selection_controller.dart';
import '../buttons/custom_elevated_button.dart';

enum CompanyFilterType { segmento, cidade }

class FilterCompaniesBottomSheetWidget extends StatefulWidget {
  final ItemSelectionController controller;

  const FilterCompaniesBottomSheetWidget({
    super.key,
    required this.controller,
  });

  @override
  State<FilterCompaniesBottomSheetWidget> createState() => _FilterCompaniesBottomSheetWidgetState();
}

class _FilterCompaniesBottomSheetWidgetState extends State<FilterCompaniesBottomSheetWidget> {
  CompanyFilterType _selectedFilterType = CompanyFilterType.segmento;

  @override
  void initState() {
    super.initState();
    if (widget.controller.filteredCompanySegmentsListToSelect.isNotEmpty) {
      _selectedFilterType = CompanyFilterType.segmento;
    } else if (widget.controller.cityFilterText.isNotEmpty || widget.controller.stateFilterText.isNotEmpty) {
      _selectedFilterType = CompanyFilterType.cidade;
    } else {
      _selectedFilterType = CompanyFilterType.segmento;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Definir uma altura para o BottomSheet.
    // Usamos MediaQuery para que ele se adapte a diferentes tamanhos de tela.
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomSheetHeight = screenHeight * 0.85; // Ocupa 85% da altura da tela. Ajuste conforme necessário.

    return Container(
      height: bottomSheetHeight, // Define a altura explícita para o Container principal do modal.
      decoration: const BoxDecoration(
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column( // O Column principal agora controla o layout do modal.
        mainAxisSize: MainAxisSize.max, // Ocupa o máximo de espaço vertical disponível no Container pai.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Conteúdo Fixo do Topo: Título e SegmentedButton
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                Center(
                  child: SegmentedButton<CompanyFilterType>(
                    segments: const <ButtonSegment<CompanyFilterType>>[
                      ButtonSegment<CompanyFilterType>(
                        value: CompanyFilterType.segmento,
                        label: Text('Segmento'),
                      ),
                      ButtonSegment<CompanyFilterType>(
                        value: CompanyFilterType.cidade,
                        label: Text('Cidade'),
                      ),
                    ],
                    selected: <CompanyFilterType>{_selectedFilterType},
                    onSelectionChanged: (Set<CompanyFilterType> newSelection) {
                      setState(() {
                        _selectedFilterType = newSelection.first;
                        if (_selectedFilterType == CompanyFilterType.segmento) {
                          widget.controller.clearSelectedCityFilter();
                        } else {
                          widget.controller.clearSelectedCompanySegments();
                        }
                      });
                    },
                    style: SegmentedButton.styleFrom(
                      selectedBackgroundColor: AppColors.primaryGreenColor,
                      selectedForegroundColor: AppColors.primaryWhiteColor,
                      foregroundColor: AppColors.primaryBlackColor,
                      side: const BorderSide(color: AppColors.formGreyColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Título do segmento/cidade (também fixo)
                if (_selectedFilterType == CompanyFilterType.segmento)
                  Text(
                    'Segmento:',
                    style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
                  )
                else if (_selectedFilterType == CompanyFilterType.cidade) ...[
                  Text(
                    'Estado:',
                    style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
                  ),
                ],
                const SizedBox(height: 10),
              ],
            ),
          ),

          // Conteúdo do Meio (ROLÁVEL): Segmentos ou Campos de Cidade/Estado
          Expanded( // Este Expanded é CRUCIAL! Ele faz com que o SingleChildScrollView ocupe o espaço restante.
            child: SingleChildScrollView( // O SingleChildScrollView agora envolve apenas o conteúdo que deve rolar.
              padding: const EdgeInsets.symmetric(horizontal: 16), // Padding para o conteúdo rolavel
              child: Column( // Um Column interno para organizar o conteúdo rolavel.
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Importante para que o Column não force seu tamanho
                children: [
                  if (_selectedFilterType == CompanyFilterType.segmento) ...[
                    Observer(
                      builder: (_) {
                        final Set<int> selectedSegmentsFromController =
                        widget.controller.filteredCompanySegmentsListToSelect.map((s) => s.value).toSet();
                        return Wrap( // O Wrap dos segmentos
                          spacing: 10,
                          runSpacing: 5,
                          children: widget.controller.companySegmentsListToSelect.map((companySegment) {
                            final isSelected = selectedSegmentsFromController.contains(companySegment.value);
                            return GestureDetector(
                              onTap: () {
                                final Set<int> updatedSelectedIds = Set<int>.from(selectedSegmentsFromController);
                                if (updatedSelectedIds.contains(companySegment.value)) {
                                  updatedSelectedIds.remove(companySegment.value);
                                } else {
                                  updatedSelectedIds.add(companySegment.value);
                                }
                                widget.controller.updateSelectedCompanySegments(updatedSelectedIds);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                    color: isSelected ? AppColors.primaryGreenColor : Colors.transparent,
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(color: AppColors.formGreyColor, width: 1)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      companySegment.label ?? 'Sem Label',
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
                        );
                      },
                    ),
                  ] else if (_selectedFilterType == CompanyFilterType.cidade) ...[
                    // Autocomplete de Estado
                    Autocomplete<String>(
                      initialValue: TextEditingValue(text: widget.controller.stateFilterText),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return widget.controller.getUniqueStates();
                        }
                        return widget.controller.getUniqueStates().where((String state) {
                          return state.toLowerCase().contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        widget.controller.updateStateFilter(selection);
                      },
                      fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                        return TextField(
                          controller: fieldTextEditingController,
                          focusNode: fieldFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Digite o nome do estado',
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
                            widget.controller.updateStateFilter(text);
                          },
                          onSubmitted: (text) {
                            // widget.controller.applyCompanyFilters();
                          },
                        );
                      },
                      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4.0,
                            child: SizedBox(
                              height: options.isNotEmpty
                                  ? (options.length > 4 ? 200.0 : options.length * 50.0)
                                  : 0,
                              child: ListView.builder(
                                padding: const EdgeInsets.all(8.0),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option = options.elementAt(index);
                                  return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: ListTile(
                                      title: Text(option),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Autocomplete de Cidade
                    Text(
                      'Cidade:',
                      style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Autocomplete<String>(
                      initialValue: TextEditingValue(text: widget.controller.cityFilterText),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return widget.controller.getUniqueCities(state: widget.controller.stateFilterText);
                        }
                        return widget.controller.getUniqueCities(state: widget.controller.stateFilterText).where((String city) {
                          return city.toLowerCase().contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        widget.controller.updateCityFilter(selection);
                      },
                      fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                        return TextField(
                          controller: fieldTextEditingController,
                          focusNode: fieldFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Digite o nome da cidade',
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
                            widget.controller.updateCityFilter(text);
                          },
                          onSubmitted: (text) {
                            // widget.controller.applyCompanyFilters();
                          },
                        );
                      },
                      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4.0,
                            child: SizedBox(
                              height: options.isNotEmpty
                                  ? (options.length > 4 ? 200.0 : options.length * 50.0)
                                  : 0,
                              child: ListView.builder(
                                padding: const EdgeInsets.all(8.0),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option = options.elementAt(index);
                                  return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: ListTile(
                                      title: Text(option),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () {
                      if (_selectedFilterType == CompanyFilterType.segmento) {
                        widget.controller.clearSelectedCompanySegments();
                      } else if (_selectedFilterType == CompanyFilterType.cidade) {
                        widget.controller.clearSelectedCityFilter();
                      }
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
                      widget.controller.applyCompanyFilters();
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
    );
  }
}