import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/pagination_model/pagination_model.dart';
import 'package:new_ezagro_flutter/features/data/models/sort_model/sort_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

class ResponseModel<T> extends ResponseEntity<T> {
  const ResponseModel({
    super.data,
    super.message,
    super.path,
    super.status,
    super.pagination,
    super.sort,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'message': message,
      'path': path,
      'status': status,
      'pagination': pagination,
      'sort': sort,
    };
  }

  factory ResponseModel.fromMap(
      Map<String, dynamic> map, T Function(dynamic) dataMapper) {
    return ResponseModel(
      data: map['data'] != null ? dataMapper(map['data']) : null as T,
      message: map['message'] != null ? map['message'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
      pagination: map['pagination'] != null
          ? PaginationModel.fromMap(map['pagination'] as Map<String, dynamic>)
          : null,
      sort: map['sort'] != null
          ? SortModel.fromMap(map['sort'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  // factory ResponseModel.fromJson(String source, T Function(String) fromJsonFunction) {
  //   final map = json.decode(source) as Map<String, dynamic>;
  //   return ResponseModel(
  //     status: map['status'] != null ? map['status'] as int : null,
  //     data: map['data'] != null ? fromJsonFunction(map['data'] as String) : null as T,
  //     message: map['message'] != null ? map['message'] as String : null,
  //     path: map['path'] != null ? map['path'] as String : null,
  //   );
  // }
}