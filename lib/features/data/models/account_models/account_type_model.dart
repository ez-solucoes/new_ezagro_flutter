import 'dart:convert';

import '../../../domain/entities/account_entities/account_type_entity.dart';

class AccountTypeModel extends AccountTypeEntity {
  const AccountTypeModel({
    required super.id,
    super.name,
    super.description,
    super.active,
  });

  factory AccountTypeModel.fromEntity(AccountTypeEntity entity) =>
      AccountTypeModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        active: entity.active,
      );

  AccountTypeEntity toEntity() => AccountTypeEntity(
        id: id,
        name: name,
        description: description,
        active: active,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'active': active,
      };

  factory AccountTypeModel.fromMap(Map<String, dynamic> map) =>
      AccountTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        active: map['active'],
      );

  String toJson() => json.encode(toMap());

  factory AccountTypeModel.fromJson(String source) =>
      AccountTypeModel.fromMap(json.decode(source));
}
