import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';

import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';

class DocumentsPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appDocumentsPage;

  static navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const DocumentsPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {


    return BackgroundWidget(
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.titleAndBackArrow,
        title: documentTittleType(args!.firstArgs.toString()),
        callback: () {},
      ),
      scrollable: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 19, right: 19, bottom: 19),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: AppColors.primaryWhiteColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.dividerGreyColor)),
          child: SingleChildScrollView(
            child: Text(documentType(args!.firstArgs.ToString())),
          ),
        ),
      ),
    );
  }

  String documentTittleType(String type){
    if(type == AppStringsPortuguese.privacyPolicy) {
      return AppStringsPortuguese.privacyPolicy;
    } else {
      return AppStringsPortuguese.userTerms;
    }
  }

  //AQUI VAI O METODO PARA POPULAR O DOCUMENTO
  String documentType(String type) {
    if(type == AppStringsPortuguese.privacyPolicy) {
      return '${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum}';
    } else {
      return '${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum} ${AppStringsPortuguese.loremIpsum}';
    }
  }
}
