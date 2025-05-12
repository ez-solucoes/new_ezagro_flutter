import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/client_models/client_model.dart';
import 'package:new_ezagro_flutter/features/data/models/contract_models/contract_model.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';
import 'package:new_ezagro_flutter/features/data/models/products_models/product_model.dart';
import 'package:new_ezagro_flutter/features/data/models/rural_producer_models/rural_producer_model.dart';
import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_list_model.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';

import '../../../domain/entities/attachment_entities/attachment_entity.dart';
import '../cost_center_models/cost_center_model.dart';

class AttachmentModel extends AttachmentEntity {
  const AttachmentModel({
    required super.id,
    required super.url,
    super.name,
    required super.isPrivate,
    required super.createdAt,
    super.updatedAt,
    super.employee,
    super.deletedAt,
    super.contract,
    super.farm,
    super.product,
    super.ruralProducer,
    super.costCenter,
    super.serviceOrder,
    super.client,
    super.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'name': name,
      'isPrivate': isPrivate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'employee': employee,
      'deletedAt': deletedAt,
      'contract': contract,
      'farm': farm,
      'product': product,
      'ruralProducer': ruralProducer,
      'costCenter': costCenter,
      'serviceOrder': serviceOrder,
      'client': client,
      'type': type,
    };
  }

  factory AttachmentModel.fromMap(Map<String, dynamic> map) {
    return AttachmentModel(
      id: map['id'] as int,
      url: map['url'] as String,
      name: map['name'] as String?,
      isPrivate: map['isPrivate'] as bool,
      createdAt: map['createdAt'] as String,
        updatedAt: map['updatedAt'] as String?,
        employee: map['employee'] as EmployeeModel?,
        deletedAt: map['deletedAt'] as String?,
        contract: map['contract'] as ContractModel?,
        farm: map['farm'] as FarmModel?,
        product: map['product'] as ProductModel?,
        ruralProducer: map['ruralProducer'] as RuralProducerModel?,
        costCenter: map['costCenter'] as CostCenterModel?,
        serviceOrder: map['serviceOrder'] as ServiceOrderModel?,
        client: map['client'] as ClientModel?,
        type: map['type'] as TypeModel?,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttachmentModel.fromJson(String source) =>
      AttachmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
