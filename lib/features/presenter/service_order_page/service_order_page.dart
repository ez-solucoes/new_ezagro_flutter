import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_outlined_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customInfoCard/custom_info_card_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customListItem/custom_list_item_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/listTitleCard/list_title_card_widget.dart';

import '../../../../../../../consts/app_colors.dart';
import '../../../consts/app_text_styles.dart';

class ServiceOrderPage extends StatelessWidget {
  const ServiceOrderPage({super.key});
  final isFinished = false;

  @override
  Widget build(BuildContext context) {
    final mockInfoList = [
      ["Fazenda: ", "Três Lagoas"],
      ["Safra: ", "29-25"],
      ["Centro de Custo Local: ", "562824"],
      ["Talhões:", "1, 2, 3, 4, 5, 6, 7"],
      ["Área total: ", "1500 ha"]
    ];
    final mockExecutionList = ["José Junior", "Lucas Souza"];
    final mockMachineryList = ["Máquina 1", "Máquina 2"];

    return BackgroundWidget(
      scrollable: true,
      appBar: const CustomAppBarWidget(
        appBarType: AppBarType.hamburgerAndTitle,
        title: AppStrings.serviceOrderTitle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _isFinished(),
            const SizedBox(height: 15,),
            const CustomInfoCardWidget(
                labelOne: "Atividade",
                textOne: "80548",
                labelTwo: "Abertura: 21/04/203",
                textTwo: "Plantio",
                infoCardType: InfoCardType.activityType),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.contourWhiteColor,
                    width: 3,
                  )),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mockInfoList.length,
                itemBuilder: (context, index) {
                  return CustomListItemWidget(
                      label: mockInfoList[index][0],
                      informationText: mockInfoList[index][1],
                      backgroundColor: index % 2 == 0
                          ? AppColors.trueWhiteColor
                          : AppColors.softGreenColor,
                      rightIcon: mockInfoList[index][0] == "Talhões:"
                          ? Icons.navigate_next
                          : null,
                      type: mockInfoList[index][0] == "Talhões:"
                          ? ListItemType.oneIconButton
                          : ListItemType.regular);
                },
              ),
            ),
            const SizedBox(height: 10),
            const CustomInfoCardWidget(
                labelOne: "Responsável",
                textOne: "Alan Brito",
                icon: Icons.edit_outlined,
                infoCardType: InfoCardType.oneLabeledInfo),
            const SizedBox(height: 10),
            const CustomInfoCardWidget(
                labelOne: "Cultura:",
                textOne: "Milho",
                labelTwo: "Variedade:",
                textTwo: "Milho dentado",
                labelThree: "Tecnologia",
                textThree: "Não Utilizada",
                icon: Icons.edit_outlined,
                infoCardType: InfoCardType.threeLabeledInfo),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.contourWhiteColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTitleCardWidget(text: "Executores:"),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mockExecutionList.length,
                    itemBuilder: (context, index) {
                      return CustomListItemWidget(
                          informationText: mockExecutionList[index],
                          backgroundColor: index % 2 == 0
                              ? AppColors.trueWhiteColor
                              : AppColors.softGreenColor,
                          leftIcon: Icons.edit_outlined,
                          rightIcon: Icons.delete_outline,
                          type: ListItemType.twoIconButtons);
                    },
                  )],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.contourWhiteColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTitleCardWidget(text: "Maquinário:"),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mockMachineryList.length,
                    itemBuilder: (context, index) {
                      return CustomListItemWidget(
                          informationText: mockMachineryList[index],
                          backgroundColor: index % 2 == 0
                              ? AppColors.trueWhiteColor
                              : AppColors.softGreenColor,
                          leftIcon: Icons.edit_outlined,
                          rightIcon: Icons.delete_outline,
                          type: ListItemType.twoIconButtons);
                    },
                  )],
              ),
            ),
            const SizedBox(height: 10.0),
            const CustomInfoCardWidget(
                labelOne: "Estoque",
                textOne: "Estoque",
                infoCardType: InfoCardType.oneLabeledInfo),
            const SizedBox(height: 10.0),
            const CustomInfoCardWidget(
                labelOne: "Previsão de início",
                textOne: "21/08/2024",
                labelTwo: "Previsão de término",
                textTwo: "22/08/2024",
                icon: Icons.edit_outlined,
                infoCardType: InfoCardType.twoLabeledInfo),
            const SizedBox(
              height: 10.0,
            ),
            const CustomInfoCardWidget(
                labelOne: "Valor do Serviço",
                textOne: "R\$1.500,00",
                infoCardType: InfoCardType.oneLabeledInfo),
            const SizedBox(
              height: 10.0,
            ),
            const CustomInfoCardWidget(
                labelOne: "Observações",
                textOne: "Sem observação",
                infoCardType: InfoCardType.oneLabeledInfo),
            const SizedBox(
              height: 15,
            ),
            _getAvailableButtons()
          ],
        ),
      ),
    );
  }

  Widget _isFinished() {
    return isFinished ?
        Row(
          children: [
            const Icon(Icons.check_circle, size: 35, color: AppColors.greenColor,),
            const SizedBox(width: 6,),
            Text(AppStrings.finishedServiceOrder,
                style: AppTextStyles.boldMediumTextStyle(color: AppColors.blackColor))
          ],
        )
        :
        const SizedBox.shrink();
  }

  Widget _getAvailableButtons() {

    return isFinished ?
      CustomElevatedButton(onPressed: () {}, label: AppStrings.resumeOSButton)
      :
      Column(
        children: [
          CustomOutlinedButton(onPressed: (){}, label: AppStrings.saveOSButton),
          CustomElevatedButton(onPressed: (){}, label: AppStrings.suspendOSButton, backgroundColor: AppColors.darkGreyColor),
          CustomElevatedButton(onPressed: (){}, label: AppStrings.cancelOSButton, backgroundColor: AppColors.redCanceledColor,),
          const SizedBox(height: 15,),
          CustomElevatedButton(onPressed: (){}, label: AppStrings.finishedOSButton)
        ],
      );
  }
}
