import '../../../domain/entities/account_entities/account_type_entity.dart';

class AccountTypeModel extends AccountTypeEntity {
  const AccountTypeModel({
    required super.id,
    required super.name,
    required super.description,
    required super.active,
  });

  factory AccountTypeModel.fromJson(Map<String, dynamic> json) => AccountTypeModel(
    id: json['id'],name: json['name'],
    description: json['description'],
    active: json['active'],
  );

  factory AccountTypeModel.fromEntity(AccountTypeEntity entity) => AccountTypeModel(
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

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'active': active,
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'active': active,
  };

  factory AccountTypeModel.fromMap(Map<String, dynamic> map) => AccountTypeModel(
    id: map['id'],
    name: map['name'],
    description: map['description'],
    active: map['active'],
  );
}