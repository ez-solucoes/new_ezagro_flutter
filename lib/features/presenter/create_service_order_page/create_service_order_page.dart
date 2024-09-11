import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/create_service_order_controller.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_outlined_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customCheckableListItem/custom_checkable_list_item_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customListHeader/custom_list_header_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/custom_selector_widget/custom_selector_widget.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_routes.dart';

class CreateServiceOrderPage extends StatefulWidget {
  const CreateServiceOrderPage({Key? key}) : super(key: key);

  static const String routePath = AppRoutes.appCreateServiceOrderPage;

  static void navigate() => Modular.to.navigate(routePath);

  @override
  State<CreateServiceOrderPage> createState() => _CreateServiceOrderPageState();
}

class _CreateServiceOrderPageState extends State<CreateServiceOrderPage> {
  final CreateServiceOrderController _controller =
      CreateServiceOrderController();
  List<List<String>> plots = List.generate(50, (index) {
    return [(index + 1).toString(), '100ha', 'milho'];
  });


  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        scrollable: false,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.hamburgerAndTitle,
          title: AppStrings.serviceOrderTitle,
        ),
        child: DefaultTabController(
            length: 4,
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  Container(
                      height: MediaQuery.sizeOf(context).height * 0.78,
                      child: TabBarView(children: <Widget>[
                        Center(
                          child: _getGeneralInformation(),
                        ),
                        Center(
                          child: _getPlotSelector(),
                        ),
                        Center(
                          child: Text("It's sunny here"),
                        ),
                        Center(
                          child: Text("It's "),
                        ),
                      ])),
                  const SizedBox(height: 10),
                  BottomButtonsWidget(
                    controller: _controller,
                  )
                ]))));
  }

  //Page 01
  Widget _getGeneralInformation() {
    return Column(children: [
      CustomSelectorWidget(
          onSelect: () {},
          items: ["Atividade 01", "Atividade 02"],
          title: AppStrings.activitySelectorTitle,
          selectorHint: AppStrings.activitySelectorHint),
      const SizedBox(
        height: 5,
      ),
      CustomSelectorWidget(
          onSelect: () {},
          items: ["CC 01", "CC 02"],
          title: AppStrings.costCenterSelectorTitle,
          selectorHint: AppStrings.costCenterSelectorHint),
      const SizedBox(
        height: 5,
      ),
      CustomSelectorWidget(
          onSelect: () {},
          items: ["Fazenda 01", "Fazenda 02"],
          title: AppStrings.farmSelectorTitle,
          selectorHint: AppStrings.farmSelectorHint),
      const SizedBox(
        height: 5,
      ),
      CustomSelectorWidget(
          onSelect: () {},
          items: ["Safra 01", "Safra 02"],
          title: AppStrings.harvestSelectorTitle,
          selectorHint: AppStrings.harvestSelectorHint)
    ]);
  }

  //Page 02
  Widget _getPlotSelector() {
    return Container(
      padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: AppColors.contourWhiteColor,
            borderRadius: BorderRadius.circular(8)),
        child: ListView.builder(
            itemCount: plots.length + 1,
            itemBuilder: (context, index) {
              return index == 0
                  ? const CustomListHeaderWidget(
                      firstColumn: "",
                      secondColumn: "Talhão",
                      thirdColumn: "Área",
                      fourthColumn: "Cultura",
                    )
                  : CustomCheckableListItemWidget(
                  indexIsChecked: _controller.selectAll,
                  firstColumn: plots[index-1][0],
                  secondColumn: plots[index-1][1],
                  thirdColumn: plots[index-1][2],
                  index: index-1,
                  onCheckBoxTap: (index){});
            }));
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
    return Observer(
        builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.page == 0
                    ? const SizedBox.shrink()
                    : CustomOutlinedButton(
                        onPressed: () {
                          controller.decrementPage();
                          DefaultTabController.of(context)
                              .animateTo(controller.page);
                        },
                        label: AppStrings.previousButton),
                CustomElevatedButton(
                    onPressed: controller.page == 4
                        ? rightButtonAction()
                        : () {
                            controller.incrementPage();
                            DefaultTabController.of(context)
                                .animateTo(controller.page);
                          },
                    label: controller.page == 4
                        ? AppStrings.finishedOSButton
                        : AppStrings.nextButton)
              ],
            ));
  }

  static rightButtonAction() {}
}
