import 'dart:convert';
import '../../../domain/entities/plot_entities/plot_history_entity.dart';
import 'plot_crop_diversity_model.dart';

class PlotHistoryModel extends PlotHistoryEntity {
  const PlotHistoryModel({
    super.plotHistoryId,
    super.plotId,
    super.groupName,
    super.number,
    super.plotSoilStage,super.isLease,
    super.cropDiversity,
    super.area,
  });

  Map<String, dynamic> toMap() => {
    'plotHistoryId': plotHistoryId,
    'plotId': plotId,
    'groupName': groupName,
    'number': number,
    'plotSoilStage': plotSoilStage,
    'isLease':isLease,
    'cropDiversity': (cropDiversity as PlotCropDiversityModel).toMap(),
    'area': area,
  };

  factory PlotHistoryModel.fromMap(Map<String, dynamic> map) => PlotHistoryModel(
    plotHistoryId: map['plotHistoryId'],
    plotId: map['plotId'],
    groupName: map['groupName'],
    number: map['number'],
    plotSoilStage: map['plotSoilStage'],
    isLease: map['isLease'],
    cropDiversity: map['cropDiversity'] == null ? null : PlotCropDiversityModel.fromMap(map['cropDiversity']),
    area: map['area'],
  );

  String toJson() => json.encode(toMap());

  factory PlotHistoryModel.fromJson(String source) =>
      PlotHistoryModel.fromMap(json.decode(source));
}