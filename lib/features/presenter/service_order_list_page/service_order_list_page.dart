import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/core/enums/service_order_type_enum.dart';
import 'package:new_ezagro_flutter/features/presenter/controllers/service_order_list_controller/service_order_list_controller.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customSearchBar/custom_search_bar.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/service_order_card_widget.dart';

import '../../../../../../../consts/app_colors.dart';
import '../../../../../../../consts/app_dimens.dart';
import '../../../consts/app_routes.dart';
import '../../../modules/domain/params/arg_params/arg_params.dart';

class ServiceOrderListPage extends StatelessWidget {

  static const String routePath = AppRoutes.appServiceOrderListPage;

  static navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  const ServiceOrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceOrderListController controller = ServiceOrderListController();
    controller.getServiceOrderList();
    return BackgroundWidget(
        scrollable: false,
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: const CustomAppBarWidget(
            appBarType: AppBarType.hamburgerAndTitle,
            title: AppStrings.serviceOrderTitle,
          ),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 0),
                    child: CustomSearchBar(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: AppDimens.titleDimen,
                          ),
                          Flexible(
                            child: ListView.separated(
                              itemCount: controller.serviceOrderListEntities.length,
                              itemBuilder: (context, index) {
                                return ServiceOrderCardWidget(
                                  id: controller.serviceOrderListEntities[index].id,
                                  serviceOrderType: controller.serviceOrderListEntities[index].activityName,
                                  farm: controller.serviceOrderListEntities[index].name,
                                  costCenter: "",
                                  openingDate: controller.serviceOrderListEntities[index].expectedStartDate,
                                  closingDate: "",
                                  status: ServiceOrderTypeEnumExtension.getEnumServiceOrderTypeFromString(controller.serviceOrderListEntities[index].status),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 8,
                                  indent: 0,
                                  endIndent: 8,
                                  color: AppColors.transparent,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.1,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.trueWhiteColor,
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: AppColors.greenColor,
              size: 50,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }
}
