import 'dart:convert';

import '../../../domain/entities/plot_entities/plot_group_entity.dart';

class PlotGroupModel extends PlotGroupEntity {
  const PlotGroupModel({
    required super.id,
    required super.name,
  });

  String toJson() => json.encode(toMap());

  factory PlotGroupModel.fromJson(String source) =>
      PlotGroupModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  factory PlotGroupModel.fromMap(Map<String, dynamic> map) => PlotGroupModel(
        id: map['id'],
        name: map['name'],
      );
}
