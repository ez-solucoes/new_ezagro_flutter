import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_striped_table/custom_striped_table_widget.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/bold_title_info_card/bold_title_info_card.dart';
import 'controller/contract_controller.dart';

class ContractPage extends StatelessWidget {

  final ArgParams args;

  static const String routePath = AppRoutes.appContractPage;

  static void navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const ContractPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ContractController>();
    controller.getContractById(args);
    return BackgroundWidget(
        scrollable: true,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.hamburgerAndTitle,
          title: AppStringsPortuguese.singularContractTitle,
        ),
        child: Observer(
          builder: (context) =>
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  BoldTitleInfoCard(titleOne: AppStringsPortuguese.contractLabel, dataOne: controller.contract?.contract ?? ""),
                  const SizedBox(height: 10,),
                  BoldTitleInfoCard(titleOne: AppStringsPortuguese.typeLabel, dataOne: controller.contract?.contractType?.name ?? ""),
                  const SizedBox(height: 10,),
                  BoldTitleInfoCard(titleOne: AppStringsPortuguese.externalCodeLabel, dataOne: controller.contract?.externalCode ?? ""),
                  const SizedBox(height: 10,),
                  BoldTitleInfoCard(titleOne: AppStringsPortuguese.costCenterLabel, dataOne: controller.contract?.costCenters?.firstOrNull?.name ?? ""),
                  const SizedBox(height: 10,),
                  BoldTitleInfoCard(titleOne: AppStringsPortuguese.startingDateLabel, dataOne: controller.contract?.startDate ?? "", titleTwo: AppStringsPortuguese.endingDateLabel, dataTwo: controller.contract?.endDate?? ""),
                  const SizedBox(height: 10,),
                  BoldTitleInfoCard(titleOne: AppStringsPortuguese.ruralProducerLabel, dataOne: controller.contract?.ruralProducer?.name ?? ""),
                  const SizedBox(height: 10,),
                  BoldTitleInfoCard(titleOne: AppStringsPortuguese.farmLabel, dataOne: controller.contract?.farm?.name ?? ""),
                  const SizedBox(height: 10,),
                  BoldTitleInfoCard(titleOne: AppStringsPortuguese.credorCompanyLabel, dataOne: controller.contract?.creditorCompany?.name ?? ""),
                  const SizedBox(height: 25,),
                  Text("Itens/Cobertura", style: AppTextStyles.labelTextButtonStyle(color: AppColors.primaryBlackColor), textAlign: TextAlign.start,),
                  const SizedBox(height: 10,),
                  Divider(height: 2,color: AppColors.dividerGreyColor,),
                  const SizedBox(height: 10,),
                  CustomStripedTable(
                      columnNames: ["#","Item","Valor"],
                      data: [["1","Item","R\$1.000m00"],["1","Item","R\$1.000m00"],["1","Item","R\$1.000m00"]],
                      maxHeight: MediaQuery.of(context).size.height*0.3,
                      onTap: (id){})

                ],),),
        ));
  }

}
