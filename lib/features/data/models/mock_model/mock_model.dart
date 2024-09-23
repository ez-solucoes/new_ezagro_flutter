import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';

class MockModel extends MockEntity {
  const MockModel() : super();

  Map<String, dynamic> toMap() {
    return {

    };
  }

  factory MockModel.fromMap(Map<String, dynamic> map) {
    return MockModel(

    );
  }

  factory MockModel.fromEntity(MockModel entity) {
    return MockModel(

    );
  }

  String toJson() => json.encode(toMap());

  factory MockModel.fromJson(String source) =>
      MockModel.fromMap(json.decode(source));

  static List<MockModel> fromListMap(List list) =>
      list.map((e) => MockModel.fromMap(e)).toList();

  static List<MockModel> fromJsonList(String source) =>
      (json.decode(source) as List)
          .map((e) => MockModel.fromMap(e))
          .toList();
}