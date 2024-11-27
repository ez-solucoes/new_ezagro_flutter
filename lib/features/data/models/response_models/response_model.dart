import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

class ResponseModel<T> extends ResponseEntity<T> {
  const ResponseModel({
    required super.data,
    required super.message,
    required super.path,
    required super.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'message': message,
      'path': path,
      'status': status,
    };
  }

  factory ResponseModel.fromMap(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) fromMapFunction) {
    return ResponseModel(
      status: map['status'] != null ? map['status'] as int : null,
      data: map['data'] != null ? fromMapFunction(map['data'] as Map<String, dynamic>) : null as T,
      message: map['message'] != null ? map['message'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source, T Function(String) fromJsonFunction) {
    final map = json.decode(source) as Map<String, dynamic>;
    return ResponseModel(
      status: map['status'] != null ? map['status'] as int : null,
      data: map['data'] != null ? fromJsonFunction(map['data'] as String) : null as T,
      message: map['message'] != null ? map['message'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
    );
  }
}
