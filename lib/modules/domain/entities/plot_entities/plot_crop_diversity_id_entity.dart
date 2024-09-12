import 'package:equatable/equatable.dart';

class PlotCropDiversityIdEntity extends Equatable {
  final int cropDiversityId;
  final int plotId;

  const PlotCropDiversityIdEntity({
    required this.cropDiversityId,
    required this.plotId,
  });

  @override
  List<Object?> get props => [
        cropDiversityId,
        plotId,
      ];
}
