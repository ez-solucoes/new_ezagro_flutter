import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/custom_search_bar.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/service_order_cell_widget.dart';

import '../../../../../../consts/app_colors.dart';
import '../../../../../../consts/app_dimens.dart';
import '../../../consts/app_routes.dart';

class ServiceOrderListPage extends StatelessWidget {
  const ServiceOrderListPage({Key? key}) : super(key: key);
  static const List<String> statusList = ['Aguard. Aprovação', 'Pausada','Em Andamento','Cancelada', 'A Iniciar','Concluído'];
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBarWidget(
                appBarType: AppBarType.hamburgerAndTitle,
                title: AppStrings.serviceOrderTitle,
              )),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
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
                                return ServiceOrderCellWidget(
                                  id: "80548",
                                  serviceOrderType: "Plantio",
                                  farm: "Fazenda de Uberlândia",
                                  costCenter: "23235",
                                  openingDate: "21/04/2023",
                                  closingDate: statusList[index] == "Concluído" ? "22/04/2023" : "",
                                  status: statusList[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
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
            child: Icon(
              Icons.add,
              color: AppColors.greenColor,
              size: 50,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
        scrollable: false);
  }
}
