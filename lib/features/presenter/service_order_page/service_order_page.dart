import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customInfoCard/custom_info_card_widget.dart';

import '../../../../../../../consts/app_colors.dart';

class ServiceOrderPage extends StatelessWidget {
  const ServiceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        scrollable: false,
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: const CustomAppBarWidget(
            appBarType: AppBarType.hamburgerAndTitle,
            title: AppStrings.serviceOrderTitle,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CustomInfoCardWidget(
                    labelOne: "Atividade",
                    textOne: "80548",
                    labelTwo: "Abertura: 21/04/203",
                    textTwo: "Plantio",
                    infoCardType: InfoCardType.activityType
                ),
                const SizedBox(height: 10.0),
                Container(
                  color: AppColors.whiteBorderColor,
                  child: Column(
                    children: [
                      Text("Título")
                    ],
                  ),
                ),
                const CustomInfoCardWidget(
                    labelOne: "Estoque",
                    textOne: "Estoque",
                    infoCardType: InfoCardType.oneLabeledInfo
                ),
                const SizedBox(height: 10.0),
                const CustomInfoCardWidget(
                    labelOne: "Responsável",
                    textOne: "Alan Brito",
                    icon: Icons.edit_outlined,
                    infoCardType: InfoCardType.oneLabeledInfo
                ),
                const SizedBox(height: 10.0),
                const CustomInfoCardWidget(
                    labelOne: "Previsão de início",
                    textOne: "21/08/2024",
                    labelTwo: "Previsão de término",
                    textTwo: "22/08/2024",
                    icon: Icons.edit_outlined,
                    infoCardType: InfoCardType.twoLabeledInfo
                ),
                const SizedBox(height: 10.0,),
                const CustomInfoCardWidget(
                    labelOne: "Cultura:",
                    textOne: "Milho",
                    labelTwo: "Variedade:",
                    textTwo: "Milho dentado",
                    labelThree: "Tecnologia",
                    textThree: "Não Utilizada",
                    icon: Icons.edit_outlined,
                    infoCardType: InfoCardType.threeLabeledInfo
                )
              ],
            ),
          )
        ),
    );
  }
}
