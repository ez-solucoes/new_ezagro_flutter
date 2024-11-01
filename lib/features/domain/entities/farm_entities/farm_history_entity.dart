import 'package:equatable/equatable.dart';

class FarmHistoryEntity extends Equatable {
  final int? farmHistoryId;
  final int? farmId;
  final String? nameLandowner;
  final String? recordLandowner;
  final String? farmName;
  final double? areaAcre;

  const FarmHistoryEntity({
    this.farmHistoryId,
    this.farmId,
    this.nameLandowner,
    this.recordLandowner,
    this.farmName,
    this.areaAcre,
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
