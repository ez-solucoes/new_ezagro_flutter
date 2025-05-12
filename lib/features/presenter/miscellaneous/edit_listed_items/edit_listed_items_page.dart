import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_widget.dart';

import '../../../../consts/app_routes.dart';
import '../../../../design_system/colors/app_colors.dart';
import '../../../domain/entities/select_entities/select_entity.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/custom_lists/custom_dynamic_list_widget.dart';
import 'edit_listed_items_controller.dart';

class EditListedItemsPage extends StatelessWidget {

  final ArgParams args;

  static const String routePath = AppRoutes.appEditListedItemsPage;

  static void navigate(ArgParams args) => Modular.to.navigate(routePath, arguments: args);

  static void push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();
  const EditListedItemsPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<EditListedItemsController>();
    controller.getAllCompaniesToSelect();

    return BackgroundWidget(
        scrollable: true,
        appBar: CustomAppBarWidget(
            title: 'Editar Empresas',
            appBarType: AppBarType.centeredTitleAndBackArrow,
          callback: () => EditListedItemsPage.pop(),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16),
          child: Observer(builder: (BuildContext context){
            return controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
              children: [
                CustomAutocompleteWidget(
                    hintText: 'Pesquisar',
                    itemList: controller.autoCompleteList,
                    onItemSelected: (SelectEntity selectedItem){
                      debugPrint('Selecionado: ${selectedItem.label}');
                    }, autoCompleteType: AutoCompleteType.outlined,
                ),
                SizedBox(height: 10),
                CustomDynamicListWidget(
                  type: DynamicListType.threeColumn,
                    listType: 'Enpresas',
                    firstTitle: 'Nome',
                    secondTitle: 'CNPJ',
                    data: ['empresa 1', 'empresa 2', 'empresa 3'],
                    maxHeight: 0.7* MediaQuery.of(context).size.height,
                    onEditTap: (){},
                  onItemTap: (index ) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          label: 'Cancelar',
                          textColor: AppColors.primaryBlackColor,
                          backgroundColor: AppColors.backgroundColor,
                          borderColor: AppColors.formGreyColor,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          label: 'Aplicar',
                          backgroundColor: AppColors.primaryGreenColor,
                          borderColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
    );
  }
}
