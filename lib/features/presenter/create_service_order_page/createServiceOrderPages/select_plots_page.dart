import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../consts/app_text_styles.dart';
import '../../modules/service_order/controller/create_service_order_controller/create_service_order_controller.dart';
import '../../widgets/buttons/custom_outlined_button.dart';
import '../../widgets/customCheckableListItem/custom_checkable_list_item_widget.dart';


class SelectPlotsPage extends StatefulWidget {
  @override
  SelectPlotPageState createState() => SelectPlotPageState();

  const SelectPlotsPage({super.key});
}

class SelectPlotPageState extends State<SelectPlotsPage> {
  final ScrollController _scrollController = ScrollController();
  final double _itemHeight = 70;
  bool _isSelecting = false;
  int? _startIndex;
  double? deltaY;
  List<List<String>> plots = List.generate(300, (index) {
    return [(index).toString(), '100ha', 'milho'];
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _autoScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 30) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    } else if (_scrollController.position.pixels <= 30) {
      _scrollController.jumpTo(0);
    }
  }

  void _onLongPressStart(LongPressStartDetails details) {
    final offset = _scrollController.offset;
    final itemIndex = ((details.localPosition.dy + offset) / _itemHeight).floor();
    deltaY = details.localPosition.dy;
    setState(() {
      _startIndex = itemIndex;

      final start = itemIndex.clamp(0, plots.length - 1);

      if (!controller.selectedPlots.contains(plots[start][0])) {
        controller.selectedPlots.add(plots[start][0]);
      }
      _isSelecting = true;
    });
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    setState(() {
      _isSelecting = false;
      _startIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {

    CreateServiceOrderController controller = Modular.get<CreateServiceOrderController>();
    return Observer(
        builder: (context) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomOutlinedButton(
                  onPressed: () {controller.toggleSelectAll();
                  },
                  label: AppStrings.selectAllButton,
                  textStyle: AppTextStyles.smallBoldTextOnCardStyle(
                      color: AppColors.blackColor)),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: AppColors.contourWhiteColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(children: [
                        CustomCheckableListItemWidget(
                            isHeader: true,
                            firstColumn: AppStrings.plotColumn,
                            secondColumn: AppStrings.areaColumn,
                            thirdColumn: AppStrings.cropColumn,
                            index: 0,
                            onCheckBoxTap: (index) {}),
                        Expanded(
                            child: GestureDetector(
                          onLongPressStart: _onLongPressStart,
                          onLongPressEnd: _onLongPressEnd,
                          onLongPressMoveUpdate: (details) {
                            if (_isSelecting) {
                              final itemIndex =
                                  (_scrollController.offset / _itemHeight)
                                          .floor() +
                                      (details.localPosition.dy / _itemHeight)
                                          .floor();
                              if (itemIndex >= 0 && itemIndex < plots.length && _startIndex != null) {
                                setState(() {
                                  int start = (_startIndex!);
                                  int end = itemIndex;

                                  if (end > start) {
                                    for (int i = start; i < end; i++) {
                                      if (!controller.selectedPlots.contains(plots[i][0])) {
                                        controller.selectedPlots.add(plots[i][0]);
                                      }
                                    }
                                    final deltaScroll = _scrollController.offset == 0 ? 130 : 30;
                                    _scrollController.jumpTo(
                                        _scrollController.position.pixels + deltaScroll);
                                    _autoScroll();
                                  } else {
                                    for (int i = end; i > start; i--) {
                                      if (!controller.selectedPlots.contains(plots[i][0])) {
                                        controller.selectedPlots.add(plots[i][0]);
                                      }
                                    }
                                    _scrollController.jumpTo(
                                        _scrollController.position.pixels - 30);
                                    _autoScroll();
                                  }
                                });
                              }
                            }
                          },
                          child: ListView.builder(
                              controller: _scrollController,
                              itemCount: plots.length,
                              itemBuilder: (context, index) {
                                return Observer(
                                    builder: (context) => SizedBox(
                                          height: _itemHeight,
                                          child: CustomCheckableListItemWidget(
                                              indexIsChecked:
                                                  controller.selectedPlots
                                                  .contains(plots[index][0]),
                                              firstColumn: plots[index][0],
                                              secondColumn: plots[index][1],
                                              thirdColumn: plots[index][2],
                                              index: index,
                                              onCheckBoxTap: (index) {
                                                if (controller.selectedPlots
                                                    .contains(
                                                        plots[index][0])) {
                                                  controller.selectedPlots
                                                      .removeWhere((e) =>
                                                          plots[index][0] == e);
                                                } else {
                                                  controller.selectedPlots
                                                      .add(plots[index][0]);
                                                }
                                              }),
                                        ));
                              }),
                        ))
                      ])))
            ]));
  }
}
