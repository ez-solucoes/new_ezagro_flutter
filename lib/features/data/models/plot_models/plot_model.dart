import 'dart:convert';
import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_group_model.dart';
import '../../../domain/entities/plot_entities/plot_entity.dart';
import '../coordinate_models/coordinate_model.dart';
import 'plot_ownership_type_model.dart';

class PlotModel extends PlotEntity {
  const PlotModel({
    required super.id,
    required super.plotGroup,
    required super.coordinate,
    required super.plotOwnerShipType,
    required super.number,
    required super.area
  });

  String toJson() => json.encode(toMap());

  factory PlotModel.fromJson(String source) =>
      PlotModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'id': id,
    'plotGroup': (plotGroup as PlotGroupModel).toMap(),
    'coordinate': (coordinate as CoordinateModel).toMap(),
    'plotOwnerShipType': (plotOwnerShipType as PlotOwnershipTypeModel).toMap(),
    'number':number,
    'area': area
  };

  factory PlotModel.fromMap(Map<String, dynamic> map) => PlotModel(
    id: map['id'],
    plotGroup: PlotGroupModel.fromMap(map['plotGroup']),
    coordinate: CoordinateModel.fromMap(map['coordinate']),
    plotOwnerShipType: PlotOwnershipTypeModel.fromMap(map['plotOwnerShipType']),
    number: map['number'],
    area: map['area']
  );
}