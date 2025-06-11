import 'dart:convert';

import '../../../domain/entities/pagination_entity/pagination_entity.dart';

class PaginationModel<T> extends PaginationEntity<T> {
  const PaginationModel({
    super.page,
    super.pageSize,
    super.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
      'total': total,
    };
  }


  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      page: map['page'] != null ? map['page'] as int : null,
      pageSize: map['pageSize']!= null ? map['pageSize'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationModel.fromJson(String source) {
    return PaginationModel.fromMap(json.decode(source));
  }
}