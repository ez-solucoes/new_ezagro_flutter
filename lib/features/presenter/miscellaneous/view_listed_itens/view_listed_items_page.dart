import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/miscellaneous/view_listed_itens/view_listed_items_controller.dart';

import '../../../../consts/app_routes.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../widgets/appbar/custom_appbar_widget.dart';
import '../../widgets/background/background_widget.dart';
import '../../widgets/custom_lists/custom_dynamic_list_widget.dart';
import '../edit_listed_items/edit_listed_items_page.dart';

class ViewListedItemsPage extends StatelessWidget {

  final ArgParams args;

  static const String routePath = AppRoutes.appViewListedItemsPage;

  static void navigate(ArgParams args) => Modular.to.navigate(routePath, arguments: args);

  static void push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();
  const ViewListedItemsPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ViewListedItemsController>();

    return BackgroundWidget(
      scrollable: true,
      appBar: CustomAppBarWidget(
        title: 'Editar Empresas',
        appBarType: AppBarType.centeredTitleAndBackArrow,
        callback: () => ViewListedItemsPage.pop(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (BuildContext context){
          return controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
            children: [
              CustomDynamicListWidget(
                type: DynamicListType.twoColumn,
                listType: 'Enpresas',
                firstTitle: 'Nome',
                secondTitle: 'CNPJ',
                data: ['empresa 1', 'empresa 2', 'empresa 3'],
                maxHeight: 0.7* MediaQuery.of(context).size.height,
                onEditTap: (){
                  debugPrint('onTap do texto');
                  EditListedItemsPage.push(ArgParams(firstArgs: 'Empresa'));
                },
                onItemTap: (index ) {},
              ),
              SizedBox(height: 10),
            ],
          );
        }),
      ),
    );
  }
}
