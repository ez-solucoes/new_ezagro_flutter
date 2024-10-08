import 'dart:convert';
import '../../../domain/entities/tax_entities/tax_entity.dart';

class TaxModel extends TaxEntity {
  const TaxModel({
    required super.id,
    required super.icmsBase,
    required super.icmsValue,
    required super.icmsStValue,
    required super.icmsRate,
    required super.ipiValue,
    required super.ipiRate,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'icmsBase': icmsBase,
        'icmsValue': icmsValue,
        'icmsStValue': icmsStValue,
        'icmsRate': icmsRate,
        'ipiValue': ipiValue,
        'ipiRate': ipiRate,
      };

  factory TaxModel.fromMap(Map<String, dynamic> map) => TaxModel(
        id: map['id'],
        icmsBase: map['icmsBase'],
        icmsValue: map['icmsValue'],
        icmsStValue: map['icmsStValue'],
        icmsRate: map['icmsRate'],
        ipiValue: map['ipiValue'],
        ipiRate: map['ipiRate'],
      );

  String toJson() => json.encode(toMap());

  factory TaxModel.fromJson(String source) =>
      TaxModel.fromMap(json.decode(source));
}
