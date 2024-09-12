import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/plot_entities/plot_crop_diversity_id_entity.dart';

class PlotCropDiversityEntity extends Equatable {
  final PlotCropDiversityIdEntity id;
  final String dtStart;
  final CropDiversityEntity cropDiversity;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}