import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../buttons/custom_elevated_button.dart';

class FilterPlotsBottomSheetWidget extends StatefulWidget {
  const FilterPlotsBottomSheetWidget({super.key});

  @override
  State<FilterPlotsBottomSheetWidget> createState() => _FilterPlotsBottomSheetWidgetState();
}

class _FilterPlotsBottomSheetWidgetState extends State<FilterPlotsBottomSheetWidget> {
  // Estados para os checkboxes
  bool _isAreaChecked = false;
  bool _isCulturaChecked = false;
  bool _isStatusChecked = false;

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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Cabeçalho do BottomSheet
            Row(
              children: [
                Icon(Icons.filter_alt_outlined, color: AppColors.primaryBlackColor),
                const SizedBox(width: 10),
                Text(
                  'Filtrar por', // Título do filtro
                  style: AppTextStyles.bottomSheetAlert(color: AppColors.formGreyColor),
                ),
              ],
            ),
            SizedBox(height: 20), // Espaçamento

            Row(
              children: [
                Expanded(
                  child: Text(
                    'Área:',
                    style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
                  ),
                ),
                Checkbox(
                  value: _isAreaChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isAreaChecked = newValue ?? false;
                    });
                    // TODO: Chamar a lógica de filtro na controller aqui, se necessário
                    // Por exemplo: controller.updateAreaFilter(_isAreaChecked);
                  },
                  activeColor: AppColors.primaryGreenColor, // Cor do checkbox quando ativo
                ),
              ],
            ),
            Divider(color: AppColors.borderWhiteColor), // Espaçamento


            Row(
              children: [
                Expanded(
                  child: Text(
                    'Cultura:',
                    style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
                  ),
                ),
                Checkbox(
                  value: _isCulturaChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isCulturaChecked = newValue ?? false;
                    });
                    // TODO: Chamar a lógica de filtro na controller aqui, se necessário
                    // Por exemplo: controller.updateCulturaFilter(_isCulturaChecked);
                  },
                  activeColor: AppColors.primaryGreenColor,
                ),
              ],
            ),
            Divider(color: AppColors.borderWhiteColor), // Espaçamento

            Row(
              children: [
                Expanded(
                  child: Text(
                    'Status:',
                    style: AppTextStyles.smallBoldTextOnCardStyle(color: AppColors.primaryBlackColor),
                  ),
                ),
                Checkbox(
                  value: _isStatusChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isStatusChecked = newValue ?? false;
                    });
                    // TODO: Chamar a lógica de filtro na controller aqui, se necessário
                    // Por exemplo: controller.updateStatusFilter(_isStatusChecked);
                  },
                  activeColor: AppColors.primaryGreenColor,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isAreaChecked = false;
                        _isCulturaChecked = false;
                        _isStatusChecked = false;
                      });
                      // TODO: Chamar a lógica de limpar filtros na controller aqui
                      // Por exemplo: controller.clearAllPlotFilters();
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
                      // TODO: Chamar a lógica de aplicar filtros na controller aqui
                      // Por exemplo: controller.applyPlotFilters(area: _isAreaChecked, cultura: _isCulturaChecked, status: _isStatusChecked);
                      Navigator.pop(context); // Fecha o BottomSheet
                    },
                    label: 'Aplicar',
                    backgroundColor: AppColors.primaryGreenColor,
                    borderColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
