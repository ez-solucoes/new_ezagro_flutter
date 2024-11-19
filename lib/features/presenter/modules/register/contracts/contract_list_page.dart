import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_striped_table/custom_striped_table_widget.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/custom_search_bar/custom_search_bar.dart';

class ContractListPage extends StatelessWidget {

  static const String routePath = AppRoutes.appContractListPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const ContractListPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Modular.get<ContractController>();
    return BackgroundWidget(
        scrollable: false,
        child: Scaffold(
            backgroundColor: AppColors.transparent,
            resizeToAvoidBottomInset: false,
            appBar: const CustomAppBarWidget(
              appBarType: AppBarType.hamburgerAndTitle,
              title: AppStringsPortuguese.pluralContractTitle,
            ),
            drawer: CustomDrawerWidget(),
            body: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 0),
                      child: CustomSearchBar(
                        onTextChanged: (search){},
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20),
                        child: CustomStripedTable(columnNames: [AppStringsPortuguese.hashtagSymbol, AppStringsPortuguese.contractNameColumn, AppStringsPortuguese.contractTypeColumn], data: List.generate(30, (index) => ["1", "Empresa", "Tipo"]),maxHeight:0.7* MediaQuery.of(context).size.height,))
                  ],
                ),
              ],
            )
        ));
  }

}
