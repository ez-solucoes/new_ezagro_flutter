import 'package:equatable/equatable.dart';

import '../compartment_entities/compartment_history_entity.dart';
import '../cost_center_entities/cost_center_history_entity.dart';

class InventoryHistoryEntity extends Equatable {
  final int inventoryHistoryId;
  final int inventoryId;
  final String name;
  final List<CompartmentHistoryEntity> compartments;
  final List<CostCenterHistoryEntity> costCenters;

  const InventoryHistoryEntity({
    required this.inventoryHistoryId,
    required this.inventoryId,
    required this.name,
    required this.compartments,
    required this.costCenters,
  });

  @override
  List<Object?> get props => [
        inventoryHistoryId,
        inventoryId,
        name,
        compartments,
        costCenters,
      ];
}
