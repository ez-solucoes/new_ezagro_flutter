import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/plot_striped_list_widget/plot_striped_list_widget.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../widgets/filter_bottom_sheet/filter_bottom_sheet.dart';
import '../controller/plots_list_controller/plots_list_controller.dart';

class PlotsListPage extends StatelessWidget {
  static const String routePath = AppRoutes.appServiceOrderPage;

  static void navigate() => Modular.to.navigate(routePath);

  const PlotsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<PlotsListController>();
    return BackgroundWidget(
      scrollable: false,
      floatButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.45),
            builder: (context) {
              return  Observer(
                  builder: (context) => StatefulBuilder(
                    builder: (BuildContext context, setState) => FilterBottomSheet(
                    filterOptions: controller.filterOptions,
                    onCheckBoxTap: (value, index) {
                      setState(() => controller.filterOptions[index] =
                      (controller.filterOptions[index].$1, value));
                    },
                    onApply: () {
                      controller.applyFilter();
                      },
                    onCleanFilters: () {
                      controller.filterOptions.replaceRange(
                        0,
                        controller.filterOptions.length,
                        controller.filterOptions.map((e) => (e.$1, false)).toList(),
                      );
                      controller.applyFilter();
                      setState(() => {});
                    },
                  )),
              );
            },
          );
        },
        backgroundColor: AppColors.primaryWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Icon(
          Icons.filter_alt_outlined,
          weight: 900,
          color: AppColors.primaryBlackColor,
          size: 50,
        ),
      ),
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: AppStringsPortuguese.plotsPageTitle,
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Observer(
          builder: (context) => PlotStripedListWidget(
              columnTitles: ["#", "Área", "Cultura", "Status"],
              plots: controller.plots,
              maxHeight: MediaQuery.of(context).size.height * 0.8),
        ),
      ),
    );
  }
}
