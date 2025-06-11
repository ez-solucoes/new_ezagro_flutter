import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_create/service_order_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/buttons/custom_floating_action_button_widget.dart';
import '../../../widgets/custom_tiles/custom_three_items_alternate_color_edit_to_check_widget.dart';
import '../../../widgets/custom_tiles/custom_three_items_alternate_color_label_to_check_widget.dart';
import '../../../widgets/filter_bottom_sheet/filter_plots_bottom_sheet_widget.dart';

class ServiceOrderCreatePlotAddPage extends StatelessWidget {
  static const String routePath = AppRoutes.appServiceOrderCreatePlotAddPage;

  static void navigate() => Modular.to.navigate(routePath);

  static Future<Object?> push() => Modular.to.pushNamed(routePath);

  static void pop() => Modular.to.pop();

  const ServiceOrderCreatePlotAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderCreateController>();
    controller.getAllFarmPlots();

    return BackgroundWidget(
      scrollable: false,
      floatButton: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFloatingActionButtonWidget(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return FilterPlotsBottomSheetWidget();
                        });
                  },
                  backgroundColor: AppColors.primaryWhiteColor,
                  icon: Icons.filter_alt_outlined,
                  iconColor: AppColors.primaryBlackColor,
                  heroTag: 'check_plot_button',
                ),
                CustomFloatingActionButtonWidget(
                  onPressed: () {},
                  backgroundColor: AppColors.primaryGreenColor,
                  icon: Icons.check,
                  iconColor: AppColors.primaryWhiteColor,
                  heroTag: 'check_plot_button',
                ),
              ],
            ),
          )
        ],
      ),
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.backArrow,
        title: AppStringsPortuguese.createServiceOrder,
        callback: () => ServiceOrderCreatePlotAddPage.pop(),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Observer(builder: (context) {
          if (controller.isFirstLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CustomThreeItemsAlternateColorEditToCheckWidget(
                          firstLabel: 'Talhão',
                          secondLabel: 'Área',
                          thirdLabel: 'Cultura',
                          initialIsSelected: false,
                          onChanged: (bool isSelected) {},
                        ),
                        Divider(color: AppColors.borderWhiteColor),
                        Expanded(
                          child: Observer(builder: (context) {
                            return ListView.builder(
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.farmPlotList.length,
                              itemBuilder: (context, index) {
                                return CustomThreeItemsAlternateColorLabelToCheckWidget(
                                  firstLabel:
                                      controller.farmPlotList[index].number.toString(),
                                  secondLabel:
                                      controller.farmPlotList[index].area!.toString(),
                                  thirdLabel: controller
                                      .farmPlotList[index].cropVariety!.crop!.name
                                      .toString(),
                                  initialIsSelected: false,
                                  onChanged: (bool isSelected) {},
                                );
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        }),
      ),
    );
  }
}
