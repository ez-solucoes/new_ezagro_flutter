import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../domain/entities/select_entities/select_entity.dart';
import '../../modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';
import '../buttons/custom_elevated_button.dart';

class FilterProductsBottomSheetWidget extends StatefulWidget {
  final List<SelectEntity> productTypesList;

  const FilterProductsBottomSheetWidget({super.key, required this.productTypesList});

  @override
  State<FilterProductsBottomSheetWidget> createState() => _FilterProductsBottomSheetWidgetState();
}

class _FilterProductsBottomSheetWidgetState extends State<FilterProductsBottomSheetWidget> {
  final Set<int> selectedProductTypes = {};
  final controller = Modular.get<PurchaseRequestCreateController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.filter_alt_outlined),
                const SizedBox(width: 10),
                Text(
                  'Filtrar por',
                  style: TextStyle(color: AppColors.formGreyColor, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Segmento:',
                  style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: widget.productTypesList.map((product) {
                    final isSelected = selectedProductTypes.contains(product.value);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedProductTypes.remove(product.value);
                          } else {
                            selectedProductTypes.add(product.value);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryGreenColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: AppColors.formGreyColor, width: 1)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product.label ?? 'Sem Label',
                              style: TextStyle(
                                color: isSelected ? AppColors.primaryWhiteColor : AppColors.primaryBlackColor,
                              ),
                            ),
                            if (isSelected) ...[
                              SizedBox(width: 5),
                              Icon(
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
                        setState(() {
                          selectedProductTypes.clear();
                          controller.clearSelectedProductTypes();
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
                        controller.updateSelectedProductTypes(selectedProductTypes);
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