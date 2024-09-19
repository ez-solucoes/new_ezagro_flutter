import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../consts/app_colors.dart';
import '../../../../../consts/app_strings.dart';
import '../../../../../consts/app_text_styles.dart';
import '../../../../../modules/presenter/widgets/buttons/custom_outlined_button.dart';
import '../../../../../modules/presenter/widgets/customCheckableListItem/custom_checkable_list_item_widget.dart';
import '../create_service_order_controller.dart';

class SelectPlotsPage extends StatefulWidget {

  @override
  _SelectPlotPageState createState() => _SelectPlotPageState();

  CreateServiceOrderController controller;

  SelectPlotsPage({
    super.key,
    required this.controller
  });

}

class _SelectPlotPageState extends State<SelectPlotsPage> {

  final ScrollController _scrollController = ScrollController();
  final double _itemHeight = 80;
  bool _isSelecting = false;
  int? _startIndex;
  int? _endIndex;
  List<List<String>> plots = List.generate(300, (index) {
    return [(index).toString(), '100ha', 'milho'];
  });
  List<String> selectedPlots = [];
  @override
  void initState() {
    super.initState();
   //_scrollController.addListener(_scrollListener);
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // if (_isSelecting) {
    //   final offset = _scrollController.offset;
    //   final viewportHeight = _scrollController.position.viewportDimension;
    //   final itemIndex = (offset / _itemHeight).floor();
    //   final visibleIndex = ((offset + viewportHeight) / _itemHeight).floor();
    //
    //   setState(() {
    //     final start = (_startIndex ?? 0).clamp(0, plots.length - 1);
    //     final end = visibleIndex.clamp(0, plots.length - 1);
    //
    //     for (int i = start; i <= end; i++) {
    //       if (!selectedPlots.contains(plots[i][0])) {
    //         selectedPlots.add(plots[i][0]);
    //       }
    //     }
    //   });
    // }
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
    final itemIndex = (details.localPosition.dy / _itemHeight).floor();
    setState(() {
      _isSelecting = true;
      _startIndex = itemIndex;
      _endIndex = itemIndex;

      final start = (_startIndex ?? 0).clamp(0, plots.length - 1);
      //final end = (_endIndex ?? 0).clamp(0, plots.length -1);

      if (!selectedPlots.contains(plots[start][0])) {
          selectedPlots.add(plots[start][0]);
        }

    });
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    setState(() {
      _isSelecting = false;
      _startIndex = null;
      _endIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
      
      return Observer(
          builder: (context) =>
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomOutlinedButton(
                    onPressed: () {widget.controller.toggleSelectAll();},
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
                              onCheckBoxTap: (index){}),
                          Expanded(
                              child: GestureDetector(
                                onLongPressStart: _onLongPressStart,
                                onLongPressEnd: _onLongPressEnd,
                                onLongPressMoveUpdate: (details) {
                                  if (_isSelecting) {
                                    final itemIndex = (details.localPosition.dy/_itemHeight).floor();
                                    if (itemIndex >= 0 && itemIndex < plots.length) {
                                      setState(() {
                                        _endIndex = itemIndex;

                                        int start = (_startIndex ?? 0);
                                        int end = (_endIndex ?? 0);

                                        for (int i = start; i <= end; i++) {
                                          if (!selectedPlots.contains(plots[i][0])) {
                                            selectedPlots.add(plots[i][0]);
                                          }
                                        }
                                      });
                                    }
                                    _endIndex = null;
                                    final RenderBox renderBox = context.findRenderObject() as RenderBox;
                                    final position = renderBox.globalToLocal(details.globalPosition);
                                    if (position.dy >= renderBox.size.height - 30) {
                                      _scrollController.jumpTo(_scrollController.position.pixels + 10);
                                      _autoScroll();
                                    } else if (position.dy <= 30) {
                                      _scrollController.jumpTo(_scrollController.position.pixels - 10);
                                      _autoScroll();
                                    }
                                  }
                                },
                                child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: plots.length,
                                    itemBuilder: (context, index) {
                                      return Observer(
                                          builder: (context) => CustomCheckableListItemWidget(
                                              indexIsChecked: selectedPlots.contains(plots[index][0]),
                                              firstColumn: plots[index][0],
                                              secondColumn: plots[index][1],
                                              thirdColumn: plots[index][2],
                                              index: index,
                                              onCheckBoxTap: (index) {
                                                if (widget.controller.plots.contains(plots[index][0])) {
                                                  widget.controller.plots.removeWhere((e) => plots[index][0] == e);
                                                } else {
                                                  widget.controller.plots.add(plots[index][0]);
                                                }
                                                widget.controller.selectedPlots["plots"] = widget.controller.plots;
                                              }));
                                    }),
                              ))
                        ])))
              ]));
  }

}