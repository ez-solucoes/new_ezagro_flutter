import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/plot_entities/plot_crop_diversity_entity.dart';

class PlotHistoryEntity extends Equatable {
  final int plotHistoryId;
  final int plotId;
  final String groupName;
  final double number;
  final String plotSoilStage;
  final bool isLease;
  final PlotCropDiversityEntity cropDiversity;
  final double area;

  const PlotHistoryEntity({
    required this.plotHistoryId,
    required this.plotId,
    required this.groupName,
    required this.number,
    required this.plotSoilStage,
    required this.isLease,
    required this.cropDiversity,
    required this.area,
  });

  @override
  List<Object?> get props => [
        plotHistoryId,
        plotId,
        groupName,
        number,
        plotSoilStage,
        isLease,
        cropDiversity,
        area,
      ];
}
