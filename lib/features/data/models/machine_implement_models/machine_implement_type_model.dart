import 'dart:convert';

import '../../../domain/entities/machine_implement_entities/machine_implement_type_entity.dart';

class MachineImplementTypeModel extends MachineImplementTypeEntity {
  const MachineImplementTypeModel({
    required super.id,
    required super.name,
    required super.machineImplementType,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'machineImplementType': machineImplementType,
      };

  factory MachineImplementTypeModel.fromMap(Map<String, dynamic> map) =>
      MachineImplementTypeModel(
        id: map['id'],
        name: map['name'],
        machineImplementType: map['machineImplementType'],
      );

  String toJson() => json.encode(toMap());

  factory MachineImplementTypeModel.fromJson(String source) =>
      MachineImplementTypeModel.fromMap(json.decode(source));
}
