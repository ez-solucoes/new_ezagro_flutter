import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/create_service_order_controller.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_outlined_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customCardWithLogo/custom_card_with_logo_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customCheckableListItem/custom_checkable_list_item_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customDatePicker/custom_date_picker_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customDoubleSelector/custom_double_selector_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customInfoCard/custom_info_card_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customListHeader/custom_list_header_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customTextInput/custom_text_input_widget.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles.dart';
import '../../../modules/presenter/widgets/customSelector/custom_selector_widget.dart';

class CreateServiceOrderPage extends StatelessWidget {
  const CreateServiceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    CreateServiceOrderController controller = CreateServiceOrderController();
    return BackgroundWidget(
        scrollable: false,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.hamburgerAndTitle,
          title: AppStrings.serviceOrderTitle,
        ),
        child: DefaultTabController(
            length: 7,
            child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(children: [
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.75,
                      child: TabBarView(children: <Widget>[
                        _getGeneralInformation(controller),
                        _getPlotSelector(controller),
                        _getExecutionersList(controller),
                        _getMachineryList(controller),
                        _getProductList(controller),
                        _getSchedulingInformation(controller),
                        _getFinalInformation(controller)
                      ])),
                  const SizedBox(height: 5),
                  BottomButtonsWidget(
                    controller: controller,
                  )
                ]))));
  }

  ///Page 01
  Widget _getGeneralInformation(CreateServiceOrderController controller) {
    return Column(children: [
      CustomSelectorWidget(
          onSelect: (value) {},
          items: ["Atividade 01", "Atividade 02"],
          title: AppStrings.activitySelectorTitle,
          selectorHint: AppStrings.activitySelectorHint),
      const SizedBox(
        height: 5,
      ),
      CustomSelectorWidget(
          onSelect: (value) {},
          items: ["CC 01", "CC 02"],
          title: AppStrings.costCenterSelectorTitle,
          selectorHint: AppStrings.costCenterSelectorHint),
      const SizedBox(
        height: 5,
      ),
      CustomSelectorWidget(
          onSelect: (value) {},
          items: ["Fazenda 01", "Fazenda 02"],
          title: AppStrings.farmSelectorTitle,
          selectorHint: AppStrings.farmSelectorHint),
      const SizedBox(
        height: 5,
      ),
      CustomSelectorWidget(
          onSelect: (value) {},
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
    return Observer(
        builder: (context) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomOutlinedButton(
                  onPressed: () {controller.toggleSelectAll();},
                  label: AppStrings.selectAllButton,
                  textStyle: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor)),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: AppColors.contourWhiteColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(children: [
                        const CustomListHeaderWidget(
                          firstColumn: "",
                          secondColumn: AppStrings.plotColumn,
                          thirdColumn: AppStrings.areaColumn,
                          fourthColumn: AppStrings.cropColumn,
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: plots.length,
                                itemBuilder: (context, index) {
                                  return Observer(
                                      builder: (context) => CustomCheckableListItemWidget(
                                      indexIsChecked: controller.selectAll,
                                      firstColumn: plots[index][0],
                                      secondColumn: plots[index][1],
                                      thirdColumn: plots[index][2],
                                      index: index,
                                      onCheckBoxTap: (index) {}));
                                }))
                      ])))
            ]));
  }

  ///Page 03
  Widget _getExecutionersList(CreateServiceOrderController controller) {
    return Observer(
        builder: (context) => Column(
              children: [
                CustomSelectorWidget(
                    onSelect: (value) {
                      controller.executioners.add(value);
                    },
                    items: ["executores 1", "ex 2", "ex 3"],
                    title: AppStrings.executionerSelectorTitle,
                    selectorHint: AppStrings.executionerSelectorHint),
                const SizedBox(height: 6),
                const Divider(
                  height: 1,
                  color: AppColors.softGreyColor,
                ),
                const SizedBox(height: 6),
                Expanded(
                    child: ListView.separated(
                  itemCount: controller.executioners.length,
                  itemBuilder: (context, index) {
                    return CustomInfoCardWidget(
                      index: index,
                      infoCardType: InfoCardType.threeLabeledInfoWithIcon,
                      labelOne: "Nome:",
                      textOne: controller.executioners[index],
                      labelTwo: "ID",
                      textTwo: "00.000.000-00",
                      labelThree: "Turno:",
                      textThree: "Matutino",
                      icon: Icons.delete_outline,
                      onIconTap: (index) {
                        controller.executioners.removeAt(index);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ))
              ],
            ));
  }

  ///Page 04
  Widget _getMachineryList(CreateServiceOrderController controller) {
    return Observer(
        builder: (context) => Column(
          children: [
            CustomSelectorWidget(
                onSelect: (value) {
                  controller.machinery.add(value);
                },
                items: ["máquina 1", "máquina 2", "máquina 3"],
                title: AppStrings.machinerySelectorTitle,
                selectorHint: AppStrings.machinerySelectorHint),
            const SizedBox(height: 6),
            const Divider(
              height: 1,
              color: AppColors.softGreyColor,
            ),
            const SizedBox(height: 6),
            Expanded(
                child: ListView.separated(
                  itemCount: controller.machinery.length,
                  itemBuilder: (context, index) {
                    return Observer(
                        builder: (context) => CustomCardWithLogoWidget(
                      index: index,
                      labelOne: "Máquina:",
                      textOne: controller.machinery[index],
                      labelTwo: "Apelido:",
                      textTwo: controller.machinery[index],
                      labelThree: "Horímetro:",
                      textThree: "Horímetro",
                      labelFour: "Quilometragem",
                      textFour: "Quilometragem",
                      icon: Icons.delete_outline,
                      logo: Icons.agriculture_sharp,
                      onIconTap: (index) {
                        controller.machinery.removeAt(index);
                      },
                    ));
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ))
          ],
        ));
  }

  ///Page 05
  Widget _getProductList(CreateServiceOrderController controller) {
    return Observer(
        builder: (context) => Column(
          children: [
            CustomSelectorWidget(
                onSelect: (value) {
                  controller.products.add(value);
                },
                items: ["Produto 1", "Produto 2", "Produto 3"],
                title: AppStrings.productSelectorTitle,
                selectorHint: AppStrings.productSelectorHint),
            const SizedBox(height: 6),
            const Divider(
              height: 1,
              color: AppColors.softGreyColor,
            ),
            const SizedBox(height: 6),
            Expanded(
                child: ListView.separated(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Observer(
                        builder: (context) => CustomCardWithLogoWidget(
                          index: index,
                          labelOne: "Produto:",
                          textOne: controller.products[index],
                          labelTwo: "Quantidade:",
                          textTwo: "Quantidade",
                          labelThree: "Recomendação",
                          textThree: "Recomendação",
                          icon: Icons.delete_outline,
                          onIconTap: (index) {
                            controller.products.removeAt(index);
                          },
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ))
          ],
        ));
  }

  ///Page 06
  Widget _getSchedulingInformation(CreateServiceOrderController controller) {
      return Flexible(child: Column(
        children: [
          const CustomDatePickerWidget(title: AppStrings.expectedStartDate),
          const CustomDatePickerWidget(title: AppStrings.expectedFinishingDate),
          CustomSelectorWidget(
              onSelect: (value){},
              items: ["Responsável 01", "Responsávl 02", "Responsável 03", "Responsável 04", ],
              title: AppStrings.responsiveSelectorTitle,
              selectorHint: AppStrings.responsibleSelectorHint)
        ],
      ));
  }

  ///Page 07
  Widget _getFinalInformation(CreateServiceOrderController controller) {
    return Column(
      children: [
        CustomDoubleSelectorWidget(
            onSelectFirst: (value){},
            itemsOne: ["C. de custo 01","C. de custo 02","C. de custo 03" ],
            titleOne: AppStrings.finalCostCenterSelector,
            selectorHintOne: AppStrings.finalCostCenterSelectorHint,
            onSelectSecond: (value){},
            itemsTwo: ["Estoque 01", "Estoque 02"],
            titleTwo: AppStrings.finalStorageSelector,
            selectorHintTwo: AppStrings.finalStorageSelectorHint),
        const SizedBox(height: 12),
        const Divider(
          height: 1,
          color: AppColors.softGreyColor,
        ),
        const SizedBox(height: 6),
        const CustomTextInputWidget(title: AppStrings.jobValueTextFieldTitle),
        const SizedBox(height: 6),
        const CustomTextInputWidget(title: AppStrings.notesTextFieldTitle)
      ],
    );
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
                        label: AppStrings.previousButton,
                        textStyle: AppTextStyles.labelTextButtonStyle(
                            color: AppColors.blackColor),
                      ),
                    CustomElevatedButton(
                    onPressed: controller.page >= 8
                        ? rightButtonAction()
                        : () {
                            controller.incrementPage();
                            DefaultTabController.of(context)
                                .animateTo(controller.page);
                          },
                    label: controller.page == 8
                        ? AppStrings.finishedOSButton
                        : AppStrings.nextButton)
              ],
            ));
  }

  static rightButtonAction() {

  }
}
