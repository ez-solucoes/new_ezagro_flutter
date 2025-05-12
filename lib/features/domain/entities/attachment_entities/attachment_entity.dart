import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/contract_entities/contract_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/rural_producer_entities/rural_producer_entity.dart';

import '../client_entities/client_entity.dart';
import '../service_order_entities/service_order_entity.dart';
import '../type_entities/type_entity.dart';

class AttachmentEntity extends Equatable {
  final int id;
  final String url;
  final String? name;
  final bool isPrivate;
  final String createdAt;
  final String? updatedAt;
  final EmployeeEntity? employee;
  final String? deletedAt;
  final ContractEntity? contract;
  final FarmEntity? farm;
  final ProductEntity? product;
  final RuralProducerEntity? ruralProducer;
  final CostCenterEntity? costCenter;
  final ServiceOrderEntity? serviceOrder;
  final ClientEntity? client;
  final TypeEntity? type;

  const AttachmentEntity({
    required this.id,
    required this.url,
    this.name,
    required this.isPrivate,
    required this.createdAt,
    this.updatedAt,
    this.employee,
    this.deletedAt,
    this.contract,
    this.farm,
    this.product,
    this.ruralProducer,
    this.costCenter,
    this.serviceOrder,
    this.client,
    this.type,
  });

  @override
  List<Object?> get props => [
        id,
        url,
        name,
        isPrivate,
        createdAt,
        updatedAt,
        employee,
        deletedAt,
        contract,
        farm,
        product,
        ruralProducer,
        costCenter,
        serviceOrder,
        client,
        type,
      ];
}
