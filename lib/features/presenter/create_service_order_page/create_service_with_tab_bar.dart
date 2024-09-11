import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/create_service_order_controller.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_outlined_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/custom_selector_widget/custom_selector_widget.dart';

class CreateServicePage extends StatelessWidget {
  const CreateServicePage({super.key});

  static int page = 0;

  @override
  Widget build(BuildContext context) {
    final CreateServiceOrderController _controller = CreateServiceOrderController();
    return BackgroundWidget(
        scrollable: false,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.hamburgerAndTitle,
          title: AppStrings.serviceOrderTitle,
        ),
        child: DefaultTabController(
          length: 4,
          child:
          Column(children: [
            Container(
                height: MediaQuery
                    .sizeOf(context)
                    .height * 0.82,
                child: TabBarView(children: <Widget>[
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                  Center(
                    child: Text("It's "),
                  ),
                ])),
            BottomButtonsWidget(controller: _controller,)
          ]
          ),
        ));
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
}
class BottomButtonsWidget extends StatelessWidget {

  const BottomButtonsWidget({
    super.key,
    required this.controller,
  });

  final CreateServiceOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        controller.page == 0
            ? const SizedBox.shrink()
            : CustomOutlinedButton(
                onPressed: () {
                  controller.decrementPage();
                  DefaultTabController.of(context).animateTo(controller.page);
                },
                label: AppStrings.previousButton),
        CustomElevatedButton(
            onPressed: controller.page == 4 ? rightButtonAction() : ()
            { controller.incrementPage();
              DefaultTabController.of(context).animateTo(controller.page);
              },
            label:
            controller.page == 4 ? AppStrings.finishedOSButton : AppStrings.nextButton)
      ],
    ));
  }

  static rightButtonAction() {

  }
}
