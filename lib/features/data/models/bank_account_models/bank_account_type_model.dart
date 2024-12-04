
import 'dart:convert';

import '../../../domain/entities/bank_account_entities/bank_account_type_entity.dart';

class BankAccountTypeModel extends BankAccountTypeEntity {
  const BankAccountTypeModel({
    required super.id,
    super.name,
    super.slug,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  factory BankAccountTypeModel.fromMap(Map<String, dynamic> map) {
    return BankAccountTypeModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankAccountTypeModel.fromJson(String source) =>
      BankAccountTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}