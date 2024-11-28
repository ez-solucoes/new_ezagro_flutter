import 'dart:convert';

import '../../../domain/entities/sort_entity/sort_entity.dart';

class SortModel extends SortEntity {
  const SortModel({
    super.sortBy,
    super.order,
  });

  Map<String, dynamic> toMap() {
    return {
      'sortBy': sortBy,
      'order': order,
    };
  }

  factory SortModel.fromMap(Map<String, dynamic> map) {
    return SortModel(
      sortBy: map['sortBy'] != null ? map['sortBy'] as String : null,
      order: map['order'] != null ? map['order'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SortModel.fromJson(String source) => SortModel.fromMap(json.decode(source));

  static List<SortModel> fromListMap(List list) =>
      list.map((e) => SortModel.fromMap(e)).toList();

  static List<SortModel> fromJsonList(String source) =>
      (json.decode(source) as List).map((e) => SortModel.fromMap(e)).toList();
}
