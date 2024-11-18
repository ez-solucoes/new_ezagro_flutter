import 'dart:convert';

import '../../../domain/entities/plot_entities/plot_crop_diversity_id_entity.dart';

class PlotCropDiversityIdModel extends PlotCropDiversityIdEntity {
  const PlotCropDiversityIdModel({
    required super.cropDiversityId,
    required super.plotId,
  });

  Map<String, dynamic> toMap() => {
        'cropDiversityId': cropDiversityId,
        'plotId': plotId,
      };

  factory PlotCropDiversityIdModel.fromMap(Map<String, dynamic> map) =>
      PlotCropDiversityIdModel(
        cropDiversityId: map['cropDiversityId'],
        plotId: map['plotId'],
      );

  String toJson() => json.encode(toMap());

  factory PlotCropDiversityIdModel.fromJson(String source) =>
      PlotCropDiversityIdModel.fromMap(json.decode(source));
}
