import 'dart:convert';
import '../../../domain/entities/farm_entities/farm_history_entity.dart';

class FarmHistoryModel extends FarmHistoryEntity {
  const FarmHistoryModel({
    super.farmHistoryId,
    super.farmId,
    super.nameLandowner,
    super.recordLandowner,
    super.farmName,
    super.areaAcre,
  });

  Map<String, dynamic> toMap() => {
    'farmHistoryId': farmHistoryId,
    'farmId': farmId,
    'nameLandowner': nameLandowner,
    'recordLandowner': recordLandowner,
    'farmName': farmName,
    'areaAcre': areaAcre,
  };

  factory FarmHistoryModel.fromMap(Map<String, dynamic> map) =>
      FarmHistoryModel(
        farmHistoryId: map['farmHistoryId'],
        farmId: map['farmId'],
        nameLandowner: map['nameLandowner'],
        recordLandowner: map['recordLandowner'],
        farmName: map['farmName'],
        areaAcre: map['areaAcre'],
      );

  String toJson() => json.encode(toMap());

  factory FarmHistoryModel.fromJson(String source) =>
      FarmHistoryModel.fromMap(json.decode(source));

}