import 'dart:convert';
import '../../../domain/entities/sort_info_entity/sort_info_entity.dart';

class SortInfoModel extends SortInfoEntity {
  @override
  final bool empty;
  @override
  final bool sorted;
  @override
  final bool unsorted;

  const SortInfoModel({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  }) : super(
    empty: empty,
    sorted: sorted,
    unsorted: unsorted,
  );

  Map<String, dynamic> toMap() {
    return {
      'empty': empty,
      'sorted': sorted,
      'unsorted': unsorted,
    };
  }

  factory SortInfoModel.fromMap(Map<String, dynamic> map) {
    return SortInfoModel(
      empty: map['empty'] as bool,
      sorted: map['sorted'] as bool,
      unsorted: map['unsorted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SortInfoModel.fromJson(String source) =>
      SortInfoModel.fromMap(json.decode(source));

  static List<SortInfoModel> fromListMap(List list) =>
      list.map((e) => SortInfoModel.fromMap(e)).toList();

  static List<SortInfoModel> fromJsonList(String source) =>
      (json.decode(source) as List)
          .map((e) => SortInfoModel.fromMap(e))
          .toList();
}
