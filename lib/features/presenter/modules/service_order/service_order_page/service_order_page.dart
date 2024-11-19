import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/core/enums/field_service_order_type_enum.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/controller/service_order_controller/service_order_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/controller/service_order_controller/ui_service_order_controller.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../core/enums/field_service_order_status_enum.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/buttons/custom_outlined_button.dart';
import '../../../widgets/custom_info_card/custom_info_card_widget.dart';
import '../../../widgets/custom_list_item/custom_list_item_widget.dart';
import '../../../widgets/list_title_card/list_title_card_widget.dart';
import '../service_order_list_page/service_order_list_page.dart';

class ServiceOrderPage extends StatelessWidget {
  final ArgParams args;
  static const String routePath = AppRoutes.appServiceOrderPage;

  static void navigate(ArgParams args) => Modular.to.navigate(routePath, arguments: args);

  const ServiceOrderPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ServiceOrderController>();
    controller.serviceOrderId = args.firstArgs as int;
    controller.getServiceOrder();
    final uiController = UiServiceOrderController(
        type: getFieldServiceOrderTypeEnum(controller.serviceOrder?.agriculturalActivity?.activityType ?? ""),
        status: fieldServiceOrderStatusEnum(controller.serviceOrder?.status ?? "")
    );
    return BackgroundWidget(
      scrollable: true,
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        title: AppStringsPortuguese.serviceOrderTitle,
         callback: (){
            ServiceOrderListPage.navigate();
         }
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (context) => Column(
            children: [
              _isFinished(uiController.isFinished()),
              const SizedBox(height: 15,),
              CustomInfoCardWidget(
                  labelOne: AppStringsPortuguese.activityLabel,
                  textOne: controller.getNewPlantingString(),
                  labelTwo: "${AppStringsPortuguese.openingDateLabel} ${controller.serviceOrder?.activityStart ?? ""}",
                  textTwo: controller.serviceOrder?.agriculturalActivity?.activityName ?? "",
                  infoCardType: InfoCardType.activityType),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.borderWhiteColor,
                      width: 3,
                    )),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.informationList.length,
                  itemBuilder: (context, index) {
                    return CustomListItemWidget(
                        label: controller.informationList[index][0],
                        informationText: controller.informationList[index][1],
                        backgroundColor: index % 2 == 0
                            ? AppColors.primaryWhiteColor
                            : AppColors.softGreenColor,
                        rightIcon: controller.informationList[index][0] == "Talhões:"
                            ? Icons.navigate_next
                            : null,
                        type: controller.informationList[index][0] == "Talhões:"
                            ? ListItemType.oneIconButton
                            : ListItemType.regular);
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomInfoCardWidget(
                  labelOne: AppStringsPortuguese.responsibleLabel,
                  textOne: controller.serviceOrder?.employeeActivityHolder?.employeeName ?? "",
                  icon: Icons.edit_outlined,
                  infoCardType: InfoCardType.oneLabeledInfo),
              const SizedBox(height: 10),
              CustomInfoCardWidget(
                  labelOne: AppStringsPortuguese.cropLabel,
                  textOne: controller.serviceOrder?.cropDiversity?.name ?? "",
                  labelTwo: AppStringsPortuguese.varietyLabel,
                  textTwo: controller.serviceOrder?.cropDiversity?.crop?.name ?? "",
                  labelThree: AppStringsPortuguese.technologyLabel,
                  textThree: controller.serviceOrder?.cropDiversity?.technologyType?.name ?? "",
                  icon: Icons.edit_outlined,
                  infoCardType: InfoCardType.threeLabeledInfo),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.borderWhiteColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTitleCardWidget(text: AppStringsPortuguese.executorsLabel),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (controller.serviceOrder?.employees?.map((e) => e.employeeName) ?? []).toList().length,
                      itemBuilder: (context, index) {
                        return CustomListItemWidget(
                            informationText: controller.serviceOrder?.employees?.map((e) => e.employeeName).toList()[index] ?? "",
                            backgroundColor: index % 2 == 0
                                ? AppColors.primaryWhiteColor
                                : AppColors.softGreenColor,
                            leftIcon: Icons.edit_outlined,
                            rightIcon: Icons.delete_outline,
                            type: ListItemType.twoIconButtons);
                      },
                    )],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.borderWhiteColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTitleCardWidget(text: AppStringsPortuguese.machineryLabel),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (controller.serviceOrder?.machineImplements?.map((e) => e.machineImplementType?.name).toList() ?? []).length,
                      itemBuilder: (context, index) {
                        return CustomListItemWidget(
                            informationText: (controller.serviceOrder?.machineImplements?.map((e) => e.machineImplementType?.name).toList() ?? [])[index] ?? "",
                            backgroundColor: index % 2 == 0
                                ? AppColors.primaryWhiteColor
                                : AppColors.softGreenColor,
                            leftIcon: Icons.edit_outlined,
                            rightIcon: Icons.delete_outline,
                            type: ListItemType.twoIconButtons);
                      },
                    )],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.borderWhiteColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTitleCardWidget(text: AppStringsPortuguese.pestsLabel),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (controller.serviceOrder?.pests?.map((e) => e.commonName1).toList() ?? []).length,
                      itemBuilder: (context, index) {
                        return CustomListItemWidget(
                            informationText: (controller.serviceOrder?.pests?.map((e) => e.commonName1).toList() ?? [])[index],
                            backgroundColor: index % 2 == 0
                                ? AppColors.primaryWhiteColor
                                : AppColors.softGreenColor,
                            leftIcon: Icons.edit_outlined,
                            rightIcon: Icons.delete_outline,
                            type: ListItemType.twoIconButtons);
                      },
                    )],
                ),
              ),
              const SizedBox(height: 10.0),
              CustomInfoCardWidget(
                  labelOne: AppStringsPortuguese.storageLabel,
                  textOne: "Estoque",
                  infoCardType: InfoCardType.oneLabeledInfo),
              const SizedBox(height: 10.0),
              CustomInfoCardWidget(
                  labelOne: AppStringsPortuguese.estimatedStartDateLabel,
                  textOne: controller.serviceOrder?.expectedStartDate ?? "",
                  labelTwo: AppStringsPortuguese.estimatedEndDateLabel,
                  textTwo: controller.serviceOrder?.expectedEndDate ?? "",
                  icon: Icons.edit_outlined,
                  infoCardType: InfoCardType.twoLabeledInfo),
              const SizedBox(
                height: 10.0,
              ),
              CustomInfoCardWidget(
                  labelOne: AppStringsPortuguese.servicePriceLabel,
                  textOne:  "R\$ ${controller.serviceOrder?.activityValue?.toString() ?? ""}",
                  infoCardType: InfoCardType.oneLabeledInfo),
              const SizedBox(
                height: 10.0,
              ),
              CustomInfoCardWidget(
                  labelOne: AppStringsPortuguese.notesLabel,
                  textOne: controller.serviceOrder?.description ?? "",
                  infoCardType: InfoCardType.oneLabeledInfo),
              const SizedBox(
                height: 15,
              ),
              _getAvailableButtons(uiController.isFinished())
            ],
          ),
        ),
      ),
    );
  }

  Widget _isFinished(bool isFinished) {
    return isFinished ?
        Row(
          children: [
            const Icon(Icons.check_circle, size: 35, color: AppColors.primaryGreenColor,),
            const SizedBox(width: 6,),
            Text(AppStringsPortuguese.finishedServiceOrder,
                style: AppTextStyles.boldMediumTextStyle(color: AppColors.primaryBlackColor))
          ],
        )
        :
        const SizedBox.shrink();
  }

  Widget _getAvailableButtons(bool isFinished) {

    return isFinished ?
      CustomElevatedButton(onPressed: () {}, label: AppStringsPortuguese.resumeOSButton)
      :
      Column(
        children: [
          CustomOutlinedButton(onPressed: (){}, label: AppStringsPortuguese.saveOSButton, textStyle: AppTextStyles.labelTextButtonStyle(color: AppColors.primaryBlackColor),),
          CustomElevatedButton(onPressed: (){}, label: AppStringsPortuguese.suspendOSButton, backgroundColor: AppColors.darkGreyColor),
          CustomElevatedButton(onPressed: (){}, label: AppStringsPortuguese.cancelOSButton, backgroundColor: AppColors.primaryRedColor,),
          const SizedBox(height: 15,),
          CustomElevatedButton(onPressed: (){}, label: AppStringsPortuguese.finishedOSButton)
        ],
      );
  }
}
