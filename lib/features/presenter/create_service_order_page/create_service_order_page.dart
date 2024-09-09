import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_outlined_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/custom_selector_widget/custom_selector_widget.dart';

class CreateServiceOrderPage extends StatelessWidget {
  const CreateServiceOrderPage({super.key});

  static int page = 0;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      scrollable: false,
      appBar: const CustomAppBarWidget(
        appBarType: AppBarType.hamburgerAndTitle,
        title: AppStrings.serviceOrderTitle,
      ),
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Flexible(
              child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.sizeOf(context).height * 0.82),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _getPageElements(),
                      _getButtons(),
                    ],
                  )))),
    );
  }

  Widget _getPageElements() {
    switch (page) {
      case 0:
        return _getBasicInformation();
      case 1:
        return Text("1");
      case 2:
        return Text("2");
      case 3:
        return Text("3");
      case 4:
        return Text("4");
      default:
        return Text("");
    }
  }

  Widget _getBasicInformation() {
    return Column(children: [
      CustomSelectorWidget(
          onSelect: () {},
          items: ["Atividade 01", "Atividade 02"],
          label: AppStrings.activitySelector),
      const SizedBox(
        height: 13,
      ),
      CustomSelectorWidget(
          onSelect: () {},
          items: ["CC 01", "CC 02"],
          label: AppStrings.costCenterSelector),
      const SizedBox(
        height: 13,
      ),
      CustomSelectorWidget(
          onSelect: () {},
          items: ["Fazenda 01", "Fazenda 02"],
          label: AppStrings.farmSelector),
      const SizedBox(
        height: 13,
      ),
      CustomSelectorWidget(
          onSelect: () {},
          items: ["Safra 01", "Safra 02"],
          label: AppStrings.harvestSelector)
    ]);
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        page == 0
            ? const SizedBox.shrink()
            : CustomOutlinedButton(
                onPressed: () {
                  page -= 1;
                },
                label: AppStrings.previousButton),
        CustomElevatedButton(
            onPressed: rightButtonAction,
            label:
                page == 4 ? AppStrings.finishedOSButton : AppStrings.nextButton)
      ],
    );
  }

  static rightButtonAction() {
    if (page < 4) {
      page += 1;
    } else {}
  }
}
