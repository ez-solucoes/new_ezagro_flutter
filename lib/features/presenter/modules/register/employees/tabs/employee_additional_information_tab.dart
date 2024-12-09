import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/data/models/dependent_models/dependent_model.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_striped_table/custom_striped_table_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/documents_list_widget/documents_list_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../controller/employee_controller.dart';

class EmployeeAdditionalInformationTab extends StatelessWidget {

  const EmployeeAdditionalInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<EmployeeController>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MultInfoCard(
            title: AppStringsPortuguese.employeeContactorLabel,
            sectionsData: [
              (
                  [(AppStringsPortuguese.employeeCostCenterLabel, controller.employee?.contractorLocalCostCenter?.name ?? ""),(AppStringsPortuguese.employeeRuralProducerLabel, "Produtor rural")],
              [(AppStringsPortuguese.employeeFarmLabel, controller.employee?.contractorFarm?.name ?? ""),(AppStringsPortuguese.employeeCompanyLabel, controller.employee?.contractorCompany?.name ?? "")]
              )
            ]),
          const SizedBox(height: 10,),
          MultInfoCard(
              title: AppStringsPortuguese.employeeSalaryCompositionLabel,
              sectionsData: [(
              [(AppStringsPortuguese.employeeCompositionLabel, "Composição salarial"),(AppStringsPortuguese.employeeReferenceBaseLabel, controller.employee?.baseSalary ?? "")],
              [(AppStringsPortuguese.employeeReferenceLabel, "Referência")])]),
          const SizedBox(height: 10,),
          MultInfoCard(
              title: AppStringsPortuguese.additionalInformationTab,
              sectionsData: [(
                [(AppStringsPortuguese.employeeCeiLabel, "CEI"),(AppStringsPortuguese.employeeUnionCodeLabel, controller.employee?.unionCode ?? "")],
                [(AppStringsPortuguese.employeeInsuranceCodeLabel, "Código de Se."),(AppStringsPortuguese.employeeHealthCareLabel, "Plano de Saúde")]
              )]),
          const SizedBox(height: 10,),
          CustomStripedTable(
            columnNames: [AppStringsPortuguese.dependentsColumn, AppStringsPortuguese.relationColumn, AppStringsPortuguese.birthdayDateColumn],
            data: DependentModel.convertToTableList(controller.employee?.dependents ?? []),
            maxHeight: MediaQuery.of(context).size.height*0.2,
            equalColumnProportions: true,
              onTap: (id){}),
          const SizedBox(height: 10,),
          DocumentsListWidget(title: AppStringsPortuguese.employeeAttachmentsLabel, data: ["Contrato de Trabalho", "Contrato de Seguro"], maxHeight: MediaQuery.of(context).size.height*0.3, action: (){})
        ],),
    );
  }


}