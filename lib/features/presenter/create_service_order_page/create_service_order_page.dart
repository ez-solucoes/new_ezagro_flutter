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
import '../../../consts/app_text_styles.dart';

class CreateServiceOrderPage extends StatelessWidget {
  const CreateServiceOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateServiceOrderController _controller =
    CreateServiceOrderController();
    return BackgroundWidget(
        scrollable: false,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.hamburgerAndTitle,
          title: AppStrings.serviceOrderTitle,
        ),
        child: DefaultTabController(
                length: 4,
                child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(children: [
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.75,
                          child: TabBarView(children: <Widget>[
                            Center(
                              child: _getGeneralInformation(_controller),
                            ),
                            Center(
                              child: _getPlotSelector(_controller),
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

  ///Page 01
  Widget _getGeneralInformation(CreateServiceOrderController controller) {
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

  ///Page 02
  Widget _getPlotSelector(CreateServiceOrderController controller) {
    List<List<String>> plots = List.generate(50, (index) {
      return [(index).toString(), '100ha', 'milho'];
    });
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      CustomOutlinedButton(
          onPressed: () {
            controller.toggleSelectAll();
          },
          label: AppStrings.selectAllButton,
          textStyle: AppTextStyles.smallBoldTextOnCardStyle(
              color: AppColors.blackColor)),
      const SizedBox(height: 5,),
      Expanded(child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: AppColors.contourWhiteColor,
              borderRadius: BorderRadius.circular(8)),
          child: Column(children: [
            const CustomListHeaderWidget(
              firstColumn: "",
              secondColumn: "Talhão",
              thirdColumn: "Área",
              fourthColumn: "Cultura",
            ),
            Expanded(
                child: Observer(builder: (context) => ListView.builder(
                    itemCount: plots.length,
                    itemBuilder: (context, index) {
                      return CustomCheckableListItemWidget(
                          indexIsChecked: controller.selectAll,
                          firstColumn: plots[index][0],
                          secondColumn: plots[index][1],
                          thirdColumn: plots[index][2],
                          index: index,
                          onCheckBoxTap: (index) {});
                    })))
          ])))
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
                label: AppStrings.previousButton,
                textStyle: AppTextStyles.labelTextButtonStyle(
                    color: AppColors.blackColor),
              ),
        CustomElevatedButton(
            onPressed: controller.page == 4
                ? rightButtonAction()
                : () {
                    controller.incrementPage();
                    DefaultTabController.of(context).animateTo(controller.page);
                  },
            label: controller.page == 4
                ? AppStrings.finishedOSButton
                : AppStrings.nextButton)
      ],
    ));
  }

  static rightButtonAction() {}
}
