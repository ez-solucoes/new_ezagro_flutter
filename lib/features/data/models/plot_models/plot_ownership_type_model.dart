import 'dart:convert';

import '../../../domain/entities/plot_entities/plot_ownership_type_entity.dart';

class PlotOwnershipTypeModel extends PlotOwnershipTypeEntity {
  const PlotOwnershipTypeModel({
    required super.id,
    required super.namme,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'namme': namme,
      };

  factory PlotOwnershipTypeModel.fromMap(Map<String, dynamic> map) =>
      PlotOwnershipTypeModel(
        id: map['id'],
        namme: map['namme'],
      );

  String toJson() => json.encode(toMap());

  factory PlotOwnershipTypeModel.fromJson(String source) =>
      PlotOwnershipTypeModel.fromMap(json.decode(source));
}
