import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';
import '../buttons/custom_outlined_icon_button.dart';
import '../../modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart'; // Importar ItemType

class CustomProductExpandedCardWidget extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> firstColumnData;
  final List<Map<String, dynamic>> secondColumnData;
  final ItemType itemType; // Adicionado para saber se é produto ou empresa
  final VoidCallback onRemove; // Callback para a ação de remover
  final VoidCallback? onEdit; // Callback para a ação de editar (opcional para empresas)


  const CustomProductExpandedCardWidget({
    super.key,
    required this.index,
    required this.firstColumnData,
    required this.secondColumnData,
    required this.itemType, // Requerido
    required this.onRemove, // Requerido
    this.onEdit, // Opcional
  });

  @override
  Widget build(BuildContext context) {
    // Determine a cor de fundo com base no índice (alternando cores)
    final Color backgroundColor = index % 2 == 0 ? AppColors.primaryWhiteColor : AppColors.softGreenColor;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(10.0), // Adicionado padding para o conteúdo interno
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Primeira coluna de dados
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: firstColumnData.map((data) => _buildRowItem(data)).toList(),
                ),
              ),
              SizedBox(width: 16.0), // Espaço entre as colunas

              // Segunda coluna de dados
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: secondColumnData.map((data) => _buildRowItem(data)).toList(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0), // Espaço acima dos botões
            child: Row(
              // Alinha os botões. Para empresas, queremos o remover à esquerda.
              mainAxisAlignment: itemType == ItemType.company ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
              children: [
                // Botão Remover
                Expanded(
                  // Para empresas, o botão remover não precisa ocupar o espaçotodo se não tiver editar
                  flex: itemType == ItemType.company && onEdit == null ? 0 : 1,
                  child: CustomOutlinedIconButton(
                    onPressed: onRemove, // Usa o callback onRemove
                    label: 'Remover',
                    textColor: AppColors.primaryBlackColor,
                    backgroundColor: AppColors.primaryWhiteColor,
                    borderColor: AppColors.formGreyColor,
                    icon: Icons.delete_outline_outlined,
                    iconColor: AppColors.primaryBlackColor,
                  ),
                ),

                // Espaço entre os botões (somente se houver botão de editar)
                if (itemType == ItemType.product || (itemType == ItemType.company && onEdit != null))
                  const SizedBox(width: 30),

                // Botão Editar (aparece apenas para produtos ou se onEdit for fornecido para empresas)
                if (itemType == ItemType.product || (itemType == ItemType.company && onEdit != null))
                  Expanded(
                    child: CustomOutlinedIconButton(
                      onPressed: onEdit ?? () {}, // Usa o callback onEdit (ou uma função vazia se null)
                      label: 'Editar',
                      textColor: AppColors.primaryBlackColor,
                      backgroundColor: AppColors.primaryWhiteColor,
                      borderColor: AppColors.formGreyColor,
                      icon: Icons.edit_outlined,
                      iconColor: AppColors.primaryBlackColor,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para construir um item de linha (título e conteúdo)
  Widget _buildRowItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['title'] as String, // o título (string)
            style: AppTextStyles.boldTextOnCardStyle(color: AppColors.primaryBlackColor),
          ),
          Text(
            '${item['conteudo']}', // o conteúdo (pode ser dynamic convertido para string)
            style: AppTextStyles.labelOnCardStyle(color: AppColors.primaryBlackColor),
          ),
        ],
      ),
    );
  }
}
