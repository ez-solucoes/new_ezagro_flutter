import 'dart:convert';
import 'package:new_ezagro_flutter/features/data/models/company_models/company_model.dart';
import 'package:new_ezagro_flutter/features/data/models/cost_center_models/cost_center_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';

import '../../../domain/entities/farm_entities/farm_entity.dart';

class FarmModel extends FarmEntity {
  const FarmModel({
    required super.id,
    super.name,
    super.ownerName,
    super.stateRegistration,
    super.car,
    super.caepf,
    super.cnae,
    super.headquarterLatitude,
    super.headquarterLongitude,
    super.addressZipCode,
    super.addressStreet,
    super.addressNumber,
    super.addressCountry,
    super.addressNeighborhood,
    super.addressCity,
    super.addressState,
    super.addressComplement,
    super.addressReference,
    super.isFavorite,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.localCostCenter,
    super.company
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ownerName': ownerName,
      'stateRegistration': stateRegistration,
      'car': car,
      'caepf': caepf,
      'cnae': cnae,
      'headquarterLatitude': headquarterLatitude,
      'headquarterLongitude': headquarterLongitude,
      'addressZipCode': addressZipCode,
      'addressStreet': addressStreet,
      'addressNumber': addressNumber,
      'addressCountry': addressCountry,
      'addressNeighborhood': addressNeighborhood,
      'addressCity': addressCity,
      'addressState': addressState,
      'addressComplement': addressComplement,
      'addressReference': addressReference,
      'isFavorite': isFavorite,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'localCostCenter': localCostCenter,
      'company': company
    };
  }

  factory FarmModel.fromMap(Map<String, dynamic> map) {
    return FarmModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      ownerName: map['ownerName'] as String?,
      stateRegistration: map['stateRegistration'] as String?,
      car: map['car'] as String?,
      caepf: map['caepf'] as String?,
      cnae: map['cnae'] as String?,
      headquarterLatitude: map['headquarterLatitude'] as double?,
      headquarterLongitude: map['headquarterLongitude'] as double?,
      addressZipCode: map['addressZipCode'] as String?,
      addressStreet: map['addressStreet'] as String?,
      addressNumber: map['addressNumber'] as int?,
      addressCountry: map['addressCountry'] as String?,
      addressNeighborhood: map['addressNeighborhood'] as String?,
      addressCity: map['addressCity'] as String?,
      addressState: map['addressState'] as String?,
      addressComplement: map['addressComplement'] as String?,
      addressReference: map['addressReference'] as String?,
      isFavorite: map['isFavorite'] as bool?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
      localCostCenter: map['localCostCenter'] == null ? null : CostCenterModel.fromMap(map['localCostCenter']),
      company: map['company'] == null ? null : CompanyModel.fromMap(map['company'])
    );
  }

  String toJson() => json.encode(toMap());

  factory FarmModel.fromJson(String source) =>
      FarmModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<List<String>> convertToTableList(List<FarmEntity> farms) {
    return farms.map((e) => [e.id.toString(), e.name ?? "", e.localCostCenter?.name ?? ""]).toList();
  }
}