import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/stock_models/stock_item_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/stock_entities/stock_entity.dart';

import '../cost_center_models/cost_center_model.dart';
import '../farm_models/farm_model.dart';

class StockModel extends StockEntity {
  const StockModel({
    required super.id,
    super.name,
    super.email,
    super.isInternal,
    super.isExternal,
    super.latitude,
    super.longitude,
    super.phoneNumber,
    super.whatsappNumber,
    super.addressStreet,
    super.addressNumber,
    super.addressNeighborhood,
    super.addressCity,
    super.addressState,
    super.addressCountry,
    super.addressZipCode,
    super.addressComplement,
    super.addressReference,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.costCenter,
    super.farm,
    super.stockItems,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'isInternal': isInternal,
      'isExternal': isExternal,
      'latitude': latitude,
      'longitude': longitude,
      'phoneNumber': phoneNumber,
      'whatsappNumber': whatsappNumber,
      'addressStreet': addressStreet,
      'addressNumber': addressNumber,
      'addressNeighborhood': addressNeighborhood,
      'addressCity': addressCity,
      'addressState': addressState,
      'addressCountry': addressCountry,
      'addressZipCode': addressZipCode,
      'addressComplement': addressComplement,
      'addressReference': addressReference,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'costCenter': costCenter,
      'farm': farm,
      'stockItems': stockItems,
    };
  }

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String?,
      isInternal: map['isInternal'] as bool,
      isExternal: map['isExternal'] as bool,
      latitude: map['latitude'] == null ? null : map['latitude'] as String,
      longitude: map['longitude'] == null ? null : map['longitude'] as String,
      phoneNumber: map['phoneNumber'] as String?,
      whatsappNumber: map['whatsappNumber'] as String?,
      addressStreet: map['addressStreet'] as String?,
      addressNumber: map['addressNumber'] as String?,
      addressNeighborhood: map['addressNeighborhood'] as String?,
      addressCity: map['addressCity'] as String?,
      addressState: map['addressState'] as String?,
      addressCountry: map['addressCountry'] as String?,
      addressZipCode: map['addressZipCode'] as String?,
      addressComplement: map['addressComplement'] as String?,
      addressReference: map['addressReference'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String?,
      costCenter: map['costCenter'] == null ? null : CostCenterModel.fromMap(map['costCenter']),
      farm: map['farm'] == null ? null : FarmModel.fromMap(map['farm']),
      stockItems:
          map['stockItems'] == null ? null : (map['stockItems'] as List).map((e) => StockItemModel.fromMap(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory StockModel.fromJson(String source) => StockModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
