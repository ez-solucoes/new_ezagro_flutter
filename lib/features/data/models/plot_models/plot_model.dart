import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_group_model.dart';

import '../../../domain/entities/plot_entities/plot_entity.dart';
import '../coordinate_models/coordinate_model.dart';
import '../status_models/status_model.dart';
import 'plot_ownership_type_model.dart';

class PlotModel extends PlotEntity {
  const PlotModel({required super.id,
    super.plotGroup,
    super.coordinate,
    super.plotOwnerShipType,
    super.number,
    super.area,
    super.note,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.status,
    super.farmPlot,
  });

  String toJson() => json.encode(toMap());

  factory PlotModel.fromJson(String source) =>
      PlotModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() =>
      {
        'id': id,
        'plotGroup':
        plotGroup == null ? null : (plotGroup as PlotGroupModel).toMap(),
        'coordinate':
        coordinate == null ? null : (coordinate as CoordinateModel).toMap(),
        'plotOwnerShipType': plotOwnerShipType == null
            ? null
            : (plotOwnerShipType as PlotOwnershipTypeModel).toMap(),
        'number': number,
        'area': area,
        'note': note,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'status': status == null ? null : (status as StatusModel).toMap(),
      };

  factory PlotModel.fromMap(Map<String, dynamic> map) =>
      PlotModel(
          id: map['id'],
          plotGroup: map['plotGroup'] == null
              ? null
              : PlotGroupModel.fromMap(map['plotGroup']),
          coordinate: map['coordinate'] == null
              ? null
              : CoordinateModel.fromMap(map['coordinate']),
          plotOwnerShipType: map['plotOwnerShipType'] == null
              ? null
              : PlotOwnershipTypeModel.fromMap(map['plotOwnerShipType']),
          number: map['number'] as String?,
          area: map['area'] as String?,
          note: map['note'] as String?,
          createdAt: map['createdAt'] as String?,
          updatedAt: map['updatedAt'] as String?,
          deletedAt: map['deletedAt'] as String?,
          status: map['status'] == null ? null : StatusModel.fromMap(map['status']),
      );

  static List<List<String>> convertToTableList(List<PlotEntity> plots) {
    return plots.map((e) =>
    [
      e.id.toString(),
      e.area == null ? "" : "${e.area ?? ""}ha",
      e.plotGroup?.name ?? ""
    ]).toList();
  }
}
