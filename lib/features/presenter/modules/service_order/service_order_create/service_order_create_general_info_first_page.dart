import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_create/service_order_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_card_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_autocomplete/custom_autocomplete_widget.dart';

import '../../../widgets/appbar/custom_appbar_widget.dart';

class ServiceOrderCreateGeneralInfoFirstPage extends StatelessWidget {
  static const String routePath = AppRoutes.appServiceOrderCreateGeneralInfoFirstPage;
  static navigate() => Modular.to.navigate(routePath);
  static push() => Modular.to.pushNamed(routePath);
  static pop() => Modular.to.pop();

  const ServiceOrderCreateGeneralInfoFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderCreateController>();

    return BackgroundWidget(
      scrollable: true,
        appBar: CustomAppBarWidget(
        appBarType: AppBarType.backArrow,
        title: AppStringsPortuguese.createServiceOrder,
        callback: () => ServiceOrderCreateGeneralInfoFirstPage.pop(),
      ),
        child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Observer(
            builder: (context)  {
              if(controller.isFirstLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    // Observer(
                    //   builder: (context) => CustomAutocompleteCardWidget(
                    //       title: 'Atividade',
                    //       itemList: itemList,
                    //       onItemSelected: (){},
                    //       autoCompleteType: AutoCompleteType.simple,
                    //   ),
                    // )
                  ],
                );
              }
            },
          ),
        ),
    );
  }
}
