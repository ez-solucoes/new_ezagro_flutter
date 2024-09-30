import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/create_service_order_controller/create_service_order_controller.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_elevated_button.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/buttons/custom_outlined_button.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles.dart';
import 'createServiceOrderPages/executors_page.dart';
import 'createServiceOrderPages/final_information_page.dart';
import 'createServiceOrderPages/general_information_page.dart';
import 'createServiceOrderPages/machinery_page.dart';
import 'createServiceOrderPages/products_page.dart';
import 'createServiceOrderPages/schedule_page.dart';
import 'createServiceOrderPages/select_plots_page.dart';

class CreateServiceOrderPage extends StatelessWidget {
  const CreateServiceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
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
                        ExecutorsPage(controller: controller),
                        MachineryPage(controller: controller),
                        ProductsPage(controller: controller),
                        SchedulePage(controller: controller),
                        FinalInformationPage(controller: controller)
                      ])),
                  const SizedBox(height: 5),
                  Observer(
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
                                      textStyle:
                                          AppTextStyles.labelTextButtonStyle(
                                              color: AppColors.blackColor),
                                    ),
                              controller.isLastPage
                                  ? CustomElevatedButton(
                                      onPressed: () {
                                        controller.finishOSCreation;
                                      },
                                      label: AppStrings.finishedOSButton)
                                  : CustomElevatedButton(
                                      onPressed: () {
                                        controller.incrementPage();
                                        DefaultTabController.of(context)
                                            .animateTo(controller.page);
                                      },
                                      label: AppStrings.nextButton)
                            ],
                          ))
                ]))));
  }
}
