import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/single_info_card/single_info_card.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/three_info_card/three_info_card.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';

class CompanyPage extends StatelessWidget {

  static const String routePath = AppRoutes.appCompanyPage;

  static navigate() =>
      Modular.to.navigate(routePath);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Modular.get<CompanyController>();
    return BackgroundWidget(
        scrollable: true,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.hamburgerAndTitle,
          title: AppStringsPortuguese.singularCompanyTitle,
        ),
        child: Observer(
        builder: (context) =>
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(children: [
            BoldTitleInfoCard(titleOne: "Lucas Transportes", dataOne: "Moisés da Silva"),
            const SizedBox(height: 10,),
            BoldTitleInfoCard(titleOne: "CNPJ", dataOne: "00.00.00/000-00"),
            const SizedBox(height: 10,),
            BoldTitleInfoCard(titleOne: "Tipo", dataOne: "Própria"),
            const SizedBox(height: 10,),
            BoldTitleInfoCard(titleOne: "Segmento", dataOne: "Fretes"),
            const SizedBox(height: 10,),
            ThreeInfoCard(
                title: "Contato",
                info1: ("Telefone","(XX) XXXXX-XXXX"),
                info2: ("WhatsApp","(XX) XXXXX-XXXX"),
                info3: ("E-mail","contato@lucastransportes.com.br")),
            const SizedBox(height: 10,),
            MultInfoCard(
                title: "Endereço",
                columnOneData: [("CEP", "00000-000"),("Logadouro", "Rua das Nações, 124"),("Estado", "São Paulo")],
                columnTwoData: [("Cidade", "São Paulo"),("Bairro", "Ipiranga"),("País", "Brasil")]),
            const SizedBox(height: 10,),
            MultInfoCard(
                title: "Dados Bancários",
                columnOneData: [("Tipo de Conta", "Corrente"),("Agência", "0001"),("Tipo de Chave Pix", "CNPJ")],
                columnTwoData: [("Banco", "Nu Pagamentos"),("Conta", "00000-00"),("Chave Pix", "00.00.00/000-00")])
          ],),),
    ));
  }

}
