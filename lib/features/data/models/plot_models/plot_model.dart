import 'dart:convert';
import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_group_model.dart';
import '../../../domain/entities/plot_entities/plot_entity.dart';
import '../coordinate_models/coordinate_model.dart';
import 'plot_ownership_type_model.dart';

class PlotModel extends PlotEntity {
  const PlotModel({
    required super.id,
    super.plotGroup,
    super.coordinate,
    super.plotOwnerShipType,
    super.number,
    super.area
  });

  String toJson() => json.encode(toMap());

  factory PlotModel.fromJson(String source) =>
      PlotModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'id': id,
    'plotGroup': plotGroup == null ? null : (plotGroup as PlotGroupModel).toMap(),
    'coordinate': coordinate == null ? null : (coordinate as CoordinateModel).toMap(),
    'plotOwnerShipType': plotOwnerShipType == null ? null : (plotOwnerShipType as PlotOwnershipTypeModel).toMap(),
    'number':number,
    'area': area
  };

  factory PlotModel.fromMap(Map<String, dynamic> map) => PlotModel(
    id: map['id'],
    plotGroup: map['plotGroup'] == null ? null : PlotGroupModel.fromMap(map['plotGroup']),
    coordinate: map['coordinate'] == null ? null : CoordinateModel.fromMap(map['coordinate']),
    plotOwnerShipType: map['plotOwnerShipType'] == null ? null : PlotOwnershipTypeModel.fromMap(map['plotOwnerShipType']),
    number: map['number'],
    area: map['area']
  );
}