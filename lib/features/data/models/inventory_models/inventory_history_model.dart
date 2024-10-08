import 'dart:convert';
import '../../../domain/entities/inventory_entities/inventory_history_entity.dart';
import '../compartment_models/compartment_history_model.dart';
import '../cost_center_models/cost_center_history_model.dart';

class InventoryHistoryModel extends InventoryHistoryEntity {
  const InventoryHistoryModel({
    required super.inventoryHistoryId,
    required super.inventoryId,
    required super.name,
    required super.compartments,
    required super.costCenters,
  });

  String toJson() => json.encode(toMap());

  factory InventoryHistoryModel.fromJson(String source) =>
      InventoryHistoryModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'inventoryHistoryId': inventoryHistoryId,
    'inventoryId': inventoryId,
    'name': name,
    'compartments':
    compartments.map((e) => (e as CompartmentHistoryModel).toMap()).toList(),
    'costCenters':costCenters.map((e) => (e as CostCenterHistoryModel).toMap()).toList(),
  };

  factory InventoryHistoryModel.fromMap(Map<String, dynamic> map) =>
      InventoryHistoryModel(
        inventoryHistoryId: map['inventoryHistoryId'],
        inventoryId: map['inventoryId'],
        name: map['name'],
        compartments: List<CompartmentHistoryModel>.from(
            map['compartments']?.map((x) => CompartmentHistoryModel.fromMap(x))),
        costCenters: List<CostCenterHistoryModel>.from(
            map['costCenters']?.map((x) => CostCenterHistoryModel.fromMap(x))),
      );
}