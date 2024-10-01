import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_crop_diversity_id_entity.dart';
import '../crop_entities/CropDiversityEntity.dart';

class PlotCropDiversityEntity extends Equatable {
  final PlotCropDiversityIdEntity id;
  final String dtStart;
  final CropDiversityEntity cropDiversity;

  const PlotCropDiversityEntity({
    required this.id,
    required this.dtStart,
    required this.cropDiversity,
  });

  @override
  List<Object?> get props => [
        id,
        dtStart,
        cropDiversity,
      ];
}
