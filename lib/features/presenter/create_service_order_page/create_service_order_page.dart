import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/createServiceOrderPages/executioners_page.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/createServiceOrderPages/final_information_page.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/createServiceOrderPages/general_information_page.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/createServiceOrderPages/machinery_page.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/createServiceOrderPages/schedule_page.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/createServiceOrderPages/select_plots_page.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/create_service_order_controller.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_outlined_button.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles.dart';
import '../controllers/create_service_order_controller/createServiceOrderPages/products_page.dart';

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
                        GeneralInformationPage(controller: controller),
                        SelectPlotsPage(controller: controller),
                        ExecutionersPage(controller: controller),
                        MachineryPage(controller: controller),
                        ProductsPage(controller: controller),
                        SchedulePage(controller: controller),
                        FinalInformationPage(controller: controller)
                      ])),
                  const SizedBox(height: 5),
                  BottomButtonsWidget(
                    controller: controller,
                  )
                ]))));
  }
}

///Corrigir problema de operação ternária com variável observer (quebra layout na última página)
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
