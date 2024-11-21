import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_striped_table/custom_striped_table_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/documents_list_widget/documents_list_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';

class EmployeeAdditionalInformationTab extends StatelessWidget {

  const EmployeeAdditionalInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MultInfoCard(
            title: AppStringsPortuguese.employeeContactorLabel,
            sectionsData: [
              (
                  [(AppStringsPortuguese.employeeCostCenterLabel, "Uberaba"),(AppStringsPortuguese.employeeRuralProducerLabel, "Produtor Rural")],
              [(AppStringsPortuguese.employeeFarmLabel, "Três Lagoas"),(AppStringsPortuguese.employeeCompanyLabel, "Empresa")]
              )
            ]),
          const SizedBox(height: 10,),
          MultInfoCard(
              title: AppStringsPortuguese.employeeSalaryCompositionLabel,
              sectionsData: [(
              [(AppStringsPortuguese.employeeCompositionLabel, "Composição"),(AppStringsPortuguese.employeeReferenceBaseLabel, "Valor Livre")],
              [(AppStringsPortuguese.employeeReferenceLabel, "Referêcia")])]),
          const SizedBox(height: 10,),
          MultInfoCard(
              title: AppStringsPortuguese.additionalInformationTab,
              sectionsData: [(
                [(AppStringsPortuguese.employeeCeiLabel, "CEI"),(AppStringsPortuguese.employeeUnionCodeLabel, "Código Sindical")],
                [(AppStringsPortuguese.employeeInsuranceCodeLabel, "Código de Se."),(AppStringsPortuguese.employeeHealthCareLabel, "Plano de Saúde")]
              )]),
          const SizedBox(height: 10,),
          CustomStripedTable(columnNames: ["Dependentes", "Relação","Nascimento"], data: [["Julio Costa","Filho","22/11/2005"],["Ana Costa","Esposa","15/09/1973"]], maxHeight: MediaQuery.of(context).size.height*0.2, equalColumnProportions: true,),
          const SizedBox(height: 10,),
          DocumentsListWidget(title: AppStringsPortuguese.employeeAttachmentsLabel, data: ["Contrato de Trabalho", "Contrato de Seguro"], maxHeight: MediaQuery.of(context).size.height*0.3, action: (){})
        ],),
    );
  }


}