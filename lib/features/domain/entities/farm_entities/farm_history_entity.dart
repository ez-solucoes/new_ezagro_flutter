import 'package:equatable/equatable.dart';

class FarmHistoryEntity extends Equatable {
  final int farmHistoryId;
  final int farmId;
  final String nameLandowner;
  final String recordLandowner;
  final String farmName;
  final double areaAcre;

  const FarmHistoryEntity({
    required this.farmHistoryId,
    required this.farmId,
    required this.nameLandowner,
    required this.recordLandowner,
    required this.farmName,
    required this.areaAcre,
  });

  @override
  List<Object?> get props => [
        farmHistoryId,
        farmId,
        nameLandowner,
        recordLandowner,
        farmName,
        areaAcre,
      ];
}
