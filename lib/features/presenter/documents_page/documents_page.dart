import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_colors.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.hamburgerAndEmployee,
        title: AppStrings.privacyPolicy,
        employeeName: 'Fulano de tal',
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
