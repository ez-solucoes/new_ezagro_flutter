import 'package:mobx/mobx.dart';

import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../domain/entities/plot_entities/plot_entity.dart';
import '../../../../../domain/entities/plot_entities/plot_group_entity.dart';
part 'plots_list_controller.g.dart';

class PlotsListController = PlotsListControllerAbstract with _$PlotsListController;

abstract class PlotsListControllerAbstract with Store {

  @observable
  List<(String, bool)> filterOptions = [
  (AppStringsPortuguese.areaFilter, false),
  (AppStringsPortuguese.cropFilter, false),
  (AppStringsPortuguese.statusFilter, false)];

  @observable
  List<PlotEntity> plots = [
    PlotEntity(
      id: 1,
      plotGroup: PlotGroupEntity(id: 1, name: 'Grupo 1'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 123,
      area: 1000,
    ),
    PlotEntity(
      id: 2,
      plotGroup: PlotGroupEntity(id: 2, name: 'Grupo 2'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 456,
      area: 2000,
    ),
    PlotEntity(
      id: 3,
      plotGroup: PlotGroupEntity(id: 1, name: 'Grupo 1'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 789,
      area: 1500,
    ),
    PlotEntity(
      id: 4,
      plotGroup: PlotGroupEntity(id: 1, name: 'Grupo 1'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 123,
      area: 1000,
    ),
    PlotEntity(
      id: 5,
      plotGroup: PlotGroupEntity(id: 2, name: 'Grupo 2'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 456,
      area: 2000,
    ),
    PlotEntity(
      id: 6,
      plotGroup: PlotGroupEntity(id: 1, name: 'Grupo 1'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 789,
      area: 1500,
    ),
    PlotEntity(
      id: 7,
      plotGroup: PlotGroupEntity(id: 1, name: 'Grupo 1'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 789,
      area: 1500,
    ),
    PlotEntity(
      id: 8,
      plotGroup: PlotGroupEntity(id: 1, name: 'Grupo 1'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 789,
      area: 1500,
    ),
    PlotEntity(
      id: 9,
      plotGroup: PlotGroupEntity(id: 1, name: 'Grupo 1'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 789,
      area: 1500,
    ),
    PlotEntity(
      id: 10,
      plotGroup: PlotGroupEntity(id: 1, name: 'Grupo 1'),
      coordinate: null,
      plotOwnerShipType: null,
      number: 789,
      area: 1500,
    ),
  ];

  @action
  applyFilter() {

  }

  @action
  cleanFilter() {
    filterOptions.map((e) => e = (e.$1, false));
    applyFilter();
  }
}