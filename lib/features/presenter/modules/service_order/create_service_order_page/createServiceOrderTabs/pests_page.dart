import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/entities/selector_entities/selector_entity.dart';
import '../../../../../../design_system/colors/app_colors.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../widgets/custom_info_card/custom_info_card_widget.dart';
import '../../../../widgets/custom_selector/custom_selector_widget.dart';
import '../../controller/create_service_order_controller/create_service_order_controller.dart';

class PestsPage extends StatelessWidget {


  const PestsPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CreateServiceOrderController>();
    controller.getPests();
    return Observer(
        builder: (context) =>
            Column(
              children: [
                CustomSelectorWidget(
                    onSelect: (value) {
                      controller.selectedPests.add(controller.pestsOptions.firstWhere((e) => e.id == value.value));
                    },
                    items: controller.pestsOptions.map((e) => SelectorEntity(value: e.id, label: e.commonName1)).toList(),
                    title: AppStringsPortuguese.pestsSelectorTitle,
                    selectorHint: AppStringsPortuguese.pestSelectorHint),
                const SizedBox(height: 6),
                const Divider(
                  height: 1,
                  color: AppColors.dividerGreyColor,
                ),
                const SizedBox(height: 6),
                Expanded(
                    child: ListView.separated(
                      itemCount: controller.selectedPests.length,
                      itemBuilder: (context, index) {
                        return CustomInfoCardWidget(
                          index: index,
                          infoCardType: InfoCardType.threeLabeledInfoWithIcon,
                          labelOne: AppStringsPortuguese.nameField,
                          textOne: controller.selectedPests[index].commonName1,//controller.selectedPests[index],
                          labelTwo: AppStringsPortuguese.scientificNameField,
                          textTwo: controller.selectedPests[index].scientificName,
                          labelThree: "",
                          textThree: "",
                          icon: Icons.delete_outline,
                          onIconTap: (index) {
                            controller.selectedPests.removeAt(index);
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