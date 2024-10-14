import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_group_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_ownership_type_entity.dart';

import '../coordinate_entities/coordinate_entity.dart';

class PlotEntity extends Equatable {
  final int id;
  final PlotGroupEntity plotGroup;
  final CoordinateEntity coordinate;
  final PlotOwnershipTypeEntity plotOwnerShipType;
  final double number;
  final double area;

  const PlotEntity({
    required this.id,
    required this.plotGroup,
    required this.coordinate,
    required this.plotOwnerShipType,
    required this.number,
    required this.area
  });

  @override
  List<Object?> get props => [
        id,
        plotGroup,
        coordinate,
        plotOwnerShipType,
        number,
      ];
}
