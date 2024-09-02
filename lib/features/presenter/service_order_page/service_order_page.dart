import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/customInfoCard/custom_info_card_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/customSearchBar/custom_search_bar.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/service_order_cell_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/textFields/custom_outlined_text_form_field.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/textFields/custom_pinput_text_field.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/textFields/custom_underlined_text_field.dart';

import '../../../../../../../consts/app_colors.dart';
import '../../../../../../../consts/app_dimens.dart';
import '../../../../consts/app_routes.dart';

class ServiceOrderPage extends StatelessWidget {
  const ServiceOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBarWidget(
            appBarType: AppBarType.hamburgerAndTitle,
            title: AppStrings.serviceOrderTitle,
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomInfoCardWidget(
                    labelOne: "Atividade",
                    textOne: "80548",
                    labelTwo: "Abertura: 21/04/203",
                    textTwo: "Plantio",
                    infoCardType: InfoCardType.activityType
                ),
                SizedBox(height: 10.0),
                CustomInfoCardWidget(
                    labelOne: "Estoque",
                    textOne: "Estoque",
                    infoCardType: InfoCardType.oneLabeledInfo
                ),
                SizedBox(height: 10.0),
                CustomInfoCardWidget(
                    labelOne: "Responsável",
                    textOne: "Alan Brito",
                    icon: Icons.edit_outlined,
                    infoCardType: InfoCardType.oneLabeledInfo
                ),
                SizedBox(height: 10.0),
                CustomInfoCardWidget(
                    labelOne: "Previsão de início",
                    textOne: "21/08/2024",
                    labelTwo: "Previsão de término",
                    textTwo: "22/08/2024",
                    icon: Icons.edit_outlined,
                    infoCardType: InfoCardType.twoLabeledInfo
                ),
                SizedBox(height: 10.0,),
                CustomInfoCardWidget(
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
        scrollable: false);
  }
}
