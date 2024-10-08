import 'dart:convert';
import '../../../domain/entities/plot_entities/plot_history_entity.dart';
import 'plot_crop_diversity_model.dart';

class PlotHistoryModel extends PlotHistoryEntity {
  const PlotHistoryModel({
    required super.plotHistoryId,
    required super.plotId,
    required super.groupName,
    required super.number,
    required super.plotSoilStage,required super.isLease,
    required super.cropDiversity,
    required super.area,
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
    cropDiversity: PlotCropDiversityModel.fromMap(map['cropDiversity']),
    area: map['area'],
  );

  String toJson() => json.encode(toMap());

  factory PlotHistoryModel.fromJson(String source) =>
      PlotHistoryModel.fromMap(json.decode(source));
}