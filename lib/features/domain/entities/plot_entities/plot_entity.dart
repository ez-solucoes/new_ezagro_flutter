import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_group_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_ownership_type_entity.dart';

import '../coordinate_entities/coordinate_entity.dart';
import '../status_entities/status_entity.dart';
import 'farm_plot_entity.dart';

class PlotEntity extends Equatable {
  final int id;
  final String? note;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final StatusEntity? status;
  final FarmPlotEntity? farmPlot;
  final PlotGroupEntity? plotGroup;
  final CoordinateEntity? coordinate;
  final PlotOwnershipTypeEntity? plotOwnerShipType;
  final String? number;
  final String? area;

  const PlotEntity(
      {required this.id,
      this.plotGroup,
      this.coordinate,
      this.plotOwnerShipType,
      this.number,
      this.area,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.status,
      this.farmPlot,
      });

  @override
  List<Object?> get props => [
        id,
        plotGroup,
        coordinate,
        plotOwnerShipType,
        number,
        area,
        note,
        createdAt,
        updatedAt,
        deletedAt,
        status,
        farmPlot,
      ];
}
