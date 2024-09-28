import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../modules/presenter/widgets/customInfoCard/custom_info_card_widget.dart';
import '../../../../../modules/presenter/widgets/customSelector/custom_selector_widget.dart';
import '../../controllers/create_service_order_controller/create_service_order_controller.dart';

class ExecutorsPage extends StatelessWidget {
  const ExecutorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final createServiceOrderController =
        Modular.get<CreateServiceOrderController>();

    return Observer(
        builder: (context) => Column(
              children: [
                CustomSelectorWidget(
                    onSelect: (value) {
                      createServiceOrderController.selectedExecutors.add(value);
                    },
                    items: ["executores 1", "ex 2", "ex 3"],
                    title: AppStrings.executorSelectorTitle,
                    selectorHint: AppStrings.executorSelectorHint),
                const SizedBox(height: 6),
                const Divider(
                  height: 1,
                  color: AppColors.softGreyColor,
                ),
                const SizedBox(height: 6),
                Expanded(
                    child: ListView.separated(
                  itemCount:
                      createServiceOrderController.selectedExecutors.length,
                  itemBuilder: (context, index) {
                    return CustomInfoCardWidget(
                      index: index,
                      infoCardType: InfoCardType.threeLabeledInfoWithIcon,
                      labelOne: AppStrings.nameField,
                      textOne:
                          createServiceOrderController.selectedExecutors[index],
                      labelTwo: AppStrings.idField,
                      textTwo: "00.000.000-00",
                      labelThree: AppStrings.shiftField,
                      textThree: "Matutino",
                      icon: Icons.delete_outline,
                      onIconTap: (index) {
                        createServiceOrderController.selectedExecutors
                            .removeAt(index);
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
}
