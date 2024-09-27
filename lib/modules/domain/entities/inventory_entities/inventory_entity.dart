import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/address_entities/address_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/compartment_entities/compartment_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/email_entities/email_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/inventory_entities/inventory_type_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/phone_entities/phone_entity.dart';

import '../machine_implement_entities/machine_implement_entity.dart';

class InventoryEntity extends Equatable {
  final int id;
  final PhoneEntity phone;
  final EmailEntity email;
  final AddressEntity address;
  final CompanyEntity company;
  final FarmEntity farm;
  final List<CostCenterEntity> costCenters;
  final MachineImplementEntity machineImplement;
  final String name;
  final InventoryTypeEntity inventoryType;
  final bool isExternal;
  final List<CompartmentEntity> compartments;
  final String plusCode;
  final int maxSize;
  final int minSize;

  const InventoryEntity({
    required this.id,
    required this.phone,
    required this.email,
    required this.address,
    required this.company,
    required this.farm,
    required this.costCenters,
    required this.machineImplement,
    required this.name,
    required this.inventoryType,
    required this.isExternal,
    required this.compartments,
    required this.plusCode,
    required this.maxSize,
    required this.minSize,
  });

  @override
  List<Object?> get props => [
        id,
        phone,
        email,
        address,
        company,
        farm,
        costCenters,
        machineImplement,
        name,
        inventoryType,
        isExternal,
        compartments,
        plusCode,
        maxSize,
        minSize,
      ];
}
