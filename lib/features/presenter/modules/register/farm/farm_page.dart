import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_striped_table/custom_striped_table_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/documents_list_widget/documents_list_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/single_info_card/single_info_card.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/three_info_card/three_info_card.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';

class FarmPage extends StatelessWidget {

  static const String routePath = AppRoutes.appFarmPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const FarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Modular.get<FarmController>();
    return BackgroundWidget(
        scrollable: true,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.hamburgerAndTitle,
          title: AppStringsPortuguese.singularFarmTitle,
        ),
        child: Observer(
          builder: (context) =>
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MultInfoCard(
                        title: AppStringsPortuguese.singularFarmTitle,
                        column1Data: [
                          (AppStringsPortuguese.farmNameLabel, "Três Lagoas"),
                          (AppStringsPortuguese.farmOwnerLabel, "Alan Brito"),
                          (AppStringsPortuguese.farmCostCenterLabel, "Uberaba"),
                          (AppStringsPortuguese.farmExternalCodeLabel, "123456"),
                          (AppStringsPortuguese.farmCaepfLabel, "123456"),
                          (AppStringsPortuguese.farmAreaLabel, "150ha")
                        ],
                        column2Data: [
                          (AppStringsPortuguese.farmStateSubscriptionLabel, "12345678"),
                          (AppStringsPortuguese.farmOwnerRegisterLabel, "12345678"),
                          (AppStringsPortuguese.farmCompanyLabel, "Nome da Empresa"),
                          (AppStringsPortuguese.farmCarLabel, "12345678"),
                          (AppStringsPortuguese.farmCnaeLabel, "01113 - Cultivo de Cereais")
                        ]),
                    const SizedBox(height: 10,),
                    MultInfoCard(
                        title: AppStringsPortuguese.addressLabel,
                        column1Data: [(AppStringsPortuguese.addressCepLabel, "00000-000"),(AppStringsPortuguese.addressStreetLabel, "Estrada das Nações, 123"),(AppStringsPortuguese.addressStateLabel, "São Paulo"), (AppStringsPortuguese.addressReferenceLabel, "Depois da Cachoeira")],
                        column2Data: [(AppStringsPortuguese.addressCityLabel, "São Paulo"),(AppStringsPortuguese.addressNeighborhoodLabel, "Fazendas de Ouro"),(AppStringsPortuguese.addressCountryLabel, "Brasil")]),
                    const SizedBox(height: 10,),const SizedBox(height: 10,),
                    CustomStripedTable(
                        columnNames: [AppStringsPortuguese.farmPlotColumn, AppStringsPortuguese.farmAreaColumn, AppStringsPortuguese.farmCropColumn],
                        data: List.generate(30, (index) => ["$index", "100ha", "Milho"]),
                        maxHeight: MediaQuery.of(context).size.height*0.75,
                        equalColumnProportions: true,
                        ),
                    const SizedBox(height: 10,),
                    DocumentsListWidget(
                        title: AppStringsPortuguese.contractsTableTitle,
                        data: ["Contrato de Trabalho", "Contrato de Seguro"],
                        maxHeight: MediaQuery.of(context).size.height*0.2,
                        action: (){}),
                    const SizedBox(height: 10,),
                    DocumentsListWidget(
                        title: AppStringsPortuguese.attachmentsTableTitle,
                        data: ["Alvará", "Documentação"],
                        maxHeight: MediaQuery.of(context).size.height*0.2,
                        action: (){}),const SizedBox(height: 10,),
                    const SizedBox(height: 10,)
                  ],),),
        ));
  }

}
