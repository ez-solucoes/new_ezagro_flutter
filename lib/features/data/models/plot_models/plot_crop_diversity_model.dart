import 'dart:convert';
import '../../../domain/entities/plot_entities/plot_crop_diversity_entity.dart';
import '../crop_models/crop_diversity_model.dart';
import 'plot_crop_diversity_id_model.dart';

class PlotCropDiversityModel extends PlotCropDiversityEntity {
  const PlotCropDiversityModel({
    required super.id,
    required super.dtStart,
    required super.cropDiversity,});

  String toJson() => json.encode(toMap());

  factory PlotCropDiversityModel.fromJson(String source) =>
      PlotCropDiversityModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'id': (id as PlotCropDiversityIdModel).toMap(),
    'dtStart': dtStart,
    'cropDiversity': (cropDiversity as CropDiversityModel).toMap(),
  };

  factory PlotCropDiversityModel.fromMap(Map<String, dynamic> map) =>
      PlotCropDiversityModel(id: PlotCropDiversityIdModel.fromMap(map['id']),
        dtStart: map['dtStart'],
        cropDiversity: CropDiversityModel.fromMap(map['cropDiversity']),
      );
}