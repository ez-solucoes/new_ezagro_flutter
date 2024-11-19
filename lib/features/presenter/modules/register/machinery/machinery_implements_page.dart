import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/documents_list_widget/documents_list_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';

class MachineryImplementsPage extends StatelessWidget {

  static const String routePath = AppRoutes.appMachineryPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const MachineryImplementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Modular.get<MachineryController>();
    return BackgroundWidget(
        scrollable: true,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.hamburgerAndTitle,
          title: AppStringsPortuguese.machineryScreenTitle,
        ),
        child: Observer(
          builder: (context) =>
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        MultInfoCard(
                            title: AppStringsPortuguese.machineryBasicInformation,
                            sectionsData: [(
                              [(AppStringsPortuguese.machineryTypeLabel, "Colheitadeiras"), (AppStringsPortuguese.machineryAliasLabel, "Apelido")],
                              []
                            ),
                              (
                              [(AppStringsPortuguese.machineryModelLabel, "Modelo"), (AppStringsPortuguese.machineryCostCenterLabel, "Centro de Custo"), (AppStringsPortuguese.machineryDepartmentLabel, "Agrícula")],
                              [(AppStringsPortuguese.machineryBrandLabel, "Marca"), (AppStringsPortuguese.machineryYearLabel, "Ano"), (AppStringsPortuguese.machinerySubdepartmentLabel, "Subdepartamento")]
                              ),
                              (
                              [(AppStringsPortuguese.machineryAssetNumberLabel, "123456789"), (AppStringsPortuguese.machineryTelemetryNumberLabel, "123456789")],
                              []
                              )]),
                    const SizedBox(height: 10,),
                    MultInfoCard(
                        title: AppStringsPortuguese.machinerySpecificInformation,
                        sectionsData: [
                          (
                          [(AppStringsPortuguese.machineryChassisLabel, "Chassi"), (AppStringsPortuguese.machineryWorkingHours, "Horas")],
                          []
                          ),
                          (
                          [(AppStringsPortuguese.machineryKilometersLabel, "Quilômetro")],
                          [(AppStringsPortuguese.machineryTankCapacityLabel, "Capacidade")]
                          ),
                          (
                          [(AppStringsPortuguese.machineryDocumentLabel, "Documento"), (AppStringsPortuguese.machineryInvoiceLabel, "Nota Fiscal"), (AppStringsPortuguese.machineryInsuranceExpiringDateLabel, "05/05/2025"), (AppStringsPortuguese.machineryInvoiceLabel,"Contrato de Seguro")],
                          []
                          )
                        ]),
                    const SizedBox(height: 10,),
                    MultInfoCard(
                        title: AppStringsPortuguese.machineryAcquisition,
                        sectionsData: [([(AppStringsPortuguese.machineryAcquisitionDateLabel, "05/03/2021"), (AppStringsPortuguese.machineryAcquisitionValueLabel, "R\$500.000,00")],
                        [])]),
                    const SizedBox(height: 10,),
                    DocumentsListWidget(
                        title: AppStringsPortuguese.machineryMaintenance,
                        data: ["Nota Fiscal", "Nota Fiscal"],
                        maxHeight: MediaQuery.of(context).size.height*0.2,
                        action: (){}),
                    const SizedBox(height: 10,)
                    ],),),
        ));
  }

}
