import 'dart:convert';

import '../../../domain/entities/inventory_entities/inventory_entity.dart';
import '../address_models/address_model.dart';
import '../company_models/company_model.dart';
import '../compartment_models/compartment_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../email_model/email_model.dart';
import '../farm_models/farm_model.dart';
import '../machine_implement_models/machine_implement_model.dart';
import '../phone_models/phone_model.dart';
import 'inventory_type_model.dart';

class InventoryModel extends InventoryEntity {
  const InventoryModel({
    required super.id,
    required super.phone,
    required super.email,
    required super.address,
    required super.company,
    required super.farm,
    required super.costCenters,
    required super.machineImplement,
    required super.name,
    required super.inventoryType,
    required super.isExternal,
    required super.compartments,
    required super.plusCode,
    required super.maxSize,
    required super.minSize,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'phone': (phone as PhoneModel).toMap(),
        'email': (email as EmailModel).toMap(),
        'address': (address as AddressModel).toMap(),
        'company': (company as CompanyModel).toMap(),
        'farm': (farm as FarmModel).toMap(),
        'costCenters':
            costCenters.map((e) => (e as CostCenterModel).toMap()).toList(),
        'machineImplement': (machineImplement as MachineImplementModel).toMap(),
        'name': name,
        'inventoryType': (inventoryType as InventoryTypeModel).toMap(),
        'isExternal': isExternal,
        'compartments':
            compartments.map((e) => (e as CompartmentModel).toMap()).toList(),
        'plusCode': plusCode,
        'maxSize': maxSize,
        'minSize': minSize,
      };

  factory InventoryModel.fromMap(Map<String, dynamic> map) => InventoryModel(
        id: map['id'],
        phone: PhoneModel.fromMap(map['phone']),
        email: EmailModel.fromMap(map['email']),
        address: AddressModel.fromMap(map['address']),
        company: CompanyModel.fromMap(map['company']),
        farm: FarmModel.fromMap(map['farm']),
        costCenters: List<CostCenterModel>.from(
            map['costCenters']?.map((x) => CostCenterModel.fromMap(x))),
        machineImplement:
            MachineImplementModel.fromMap(map['machineImplement']),
        name: map['name'],
        inventoryType: InventoryTypeModel.fromMap(map['inventoryType']),
        isExternal: map['isExternal'],
        compartments: List<CompartmentModel>.from(
            map['compartments']?.map((x) => CompartmentModel.fromMap(x))),
        plusCode: map['plusCode'],
        maxSize: map['maxSize'],
        minSize: map['minSize'],
      );

  String toJson() => json.encode(toMap());

  factory InventoryModel.fromJson(String source) =>
      InventoryModel.fromMap(json.decode(source));
}
