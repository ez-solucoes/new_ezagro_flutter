import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/miscellaneous/view_listed_itens/view_listed_items_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_detail/purchase_request_detail_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/generic_info_card/generic_info_card.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../widgets/custom_lists/custom_dynamic_list_widget.dart';
import '../purchase_request_list/purchase_request_list_page.dart';

class PurchaseRequestDetailPage extends StatelessWidget {
  final ArgParams args;

  static const String routePath = AppRoutes.appPurchaseRequestDetailPage;

  static void navigate(ArgParams args) => Modular.to.navigate(routePath, arguments: args);

  static void push(ArgParams args) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();

  const PurchaseRequestDetailPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<PurchaseRequestDetailController>();

    controller.getPurchaseRequestById(args.firstArgs);

    return BackgroundWidget(
      scrollable: true,
      appBar: CustomAppBarWidget(
        title: AppStringsPortuguese.pluralRequestTitle,
        appBarType: AppBarType.centeredTitleAndBackArrow,
        callback: () => PurchaseRequestListPage.navigate(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (BuildContext context) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                GenericInfoCard(
                  // controller.purchaseRequestEntity!.isUrgent!,
                  sectionsData: [
                    (
                      [
                        ('Solicitação', '${controller.purchaseRequestEntity!.type!.name}', controller.purchaseRequestEntity!.isUrgent!),
                        ('Responsável', controller.purchaseRequestEntity!.responsibleEmployee!.name!, false),
                        ('Data de Criação', controller.purchaseRequestEntity!.createdAt!, false),
                        ('Etapa', controller.purchaseRequestEntity!.step!.name!, false),
                      ],
                      [
                        ('ID', controller.purchaseRequestEntity!.id.toString(), false),
                        ('Centro de Custo', controller.purchaseRequestEntity!.costCenter!.name!, false),
                        ('Fazenda', controller.purchaseRequestEntity!.farm.name!, false),
                        ('Pagamento', controller.purchaseRequestEntity!.paymentMethod!.name, false),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                CustomDynamicListWidget(
                  type: DynamicListType.oneColumn,
                  firstTitle: 'Empresas',
                  listType: 'Empresas',
                  data: controller.purchaseRequestEntity!.companies!,
                  maxHeight: 0.7 * MediaQuery.of(context).size.height,
                  onEditTap: () {
                    debugPrint('Apertou');
                    ViewListedItemsPage.push(ArgParams(firstArgs: 'Empresa'));
                  },
                  onItemTap: (index) {},
                ),
                SizedBox(height: 10),
              ],
            );
          }
        }),
      ),
    );
  }
}
