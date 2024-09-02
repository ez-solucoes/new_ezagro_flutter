import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_colors.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

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
        title: AppStrings.privacyPolicy,
        callback: () {},
      ),
      scrollable: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: AppColors.trueWhiteColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.softGreyColor)),
          child: const SingleChildScrollView(
            child: Text(
                '${AppStrings.loremIpsum} ${AppStrings.loremIpsum} ${AppStrings.loremIpsum} ${AppStrings.loremIpsum} ${AppStrings.loremIpsum} ${AppStrings.loremIpsum}'),
          ),
        ),
      ),
    );
  }
}
