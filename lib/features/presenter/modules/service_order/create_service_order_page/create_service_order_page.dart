import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../consts/app_text_styles.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/buttons/custom_outlined_button.dart';
import '../controller/create_service_order_controller/create_service_order_controller.dart';
import 'createServiceOrderTabs/executors_page.dart';
import 'createServiceOrderTabs/final_information_page.dart';
import 'createServiceOrderTabs/general_information_page.dart';
import 'createServiceOrderTabs/machinery_page.dart';
import 'createServiceOrderTabs/products_page.dart';
import 'createServiceOrderTabs/schedule_page.dart';
import 'createServiceOrderTabs/select_plots_page.dart';

class CreateServiceOrderPage extends StatelessWidget {
  final ArgParams? args;
  static const String routePath = AppRoutes.appCreateServiceOrderPage;

  static navigate() => Modular.to.navigate(routePath);

  static push() => Modular.to.pushNamed(routePath);

  //static pop(BuildContext context){Modular.to.pop(context);}

  const CreateServiceOrderPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    return BackgroundWidget(
        scrollable: false,
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStrings.createServiceOrder,
          callback: (){Modular.to.pop(context);},
        ),
        child: DefaultTabController(
            length: 7,
            child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(children: [
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.75,
                      child: TabBarView(children: <Widget>[
                        GeneralInformationPage(),
                        SelectPlotsPage(),
                        ExecutorsPage(),
                        MachineryPage(),
                        ProductsPage(),
                        SchedulePage(),
                        FinalInformationPage()
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
