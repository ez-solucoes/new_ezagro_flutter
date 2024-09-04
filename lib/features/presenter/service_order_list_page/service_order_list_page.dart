import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/core/enums/service_order_type_enum.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/customSearchBar/custom_search_bar.dart';
import 'package:new_ezagro_flutter/modules/presenter/widgets/service_order_card_widget.dart';

import '../../../../../../../consts/app_colors.dart';
import '../../../../../../../consts/app_dimens.dart';

class ServiceOrderListPage extends StatelessWidget {
  const ServiceOrderListPage({super.key});
  static const List<ServiceOrderTypeEnum> statusList = [ServiceOrderTypeEnum.approvalPending,
    ServiceOrderTypeEnum.paused,ServiceOrderTypeEnum.onGoing,ServiceOrderTypeEnum.canceled,
    ServiceOrderTypeEnum.toBeStarted,ServiceOrderTypeEnum.finished];
  @override
  Widget build(BuildContext context) {
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
                              itemCount: statusList.length,
                              itemBuilder: (context, index) {
                                return ServiceOrderCardWidget(
                                  id: "80548",
                                  serviceOrderType: "Plantio",
                                  farm: "Fazenda de Uberlândia",
                                  costCenter: "23235",
                                  openingDate: "21/04/2023",
                                  closingDate: statusList[index] == ServiceOrderTypeEnum.finished ? "22/04/2023" : "",
                                  status: statusList[index],
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
