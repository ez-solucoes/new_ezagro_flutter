import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/payment_method_entities/payment_method_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_status_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_step_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_type_entity.dart';

import '../delivery_location_entities/delivery_location_entity.dart';
import '../request_items_entities/request_item_entity.dart';

class PurchaseRequestEntity extends Equatable {
  final int? id;
  final String? quotationExpirationDate;
  final String? paymentDate;
  final String? notes;
  final bool? isUrgent;
  final bool? hasErrorInQuotationItem;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final PurchaseRequestTypeEntity? type;
  final PurchaseRequestStepEntity? step;
  final PurchaseRequestStatusEntity? status;
  final FarmEntity farm;
  final CostCenterEntity? costCenter;
  final PaymentMethodEntity? paymentMethod;
  final DeliveryLocationEntity? deliveryLocation;
  final List<CompanyEntity>? companies;
  final List<RequestItemEntity>? requestItems;
  final EmployeeEntity? responsibleEmployee;

  const PurchaseRequestEntity(
      {this.id,
      this.quotationExpirationDate,
      this.paymentDate,
      this.notes,
      this.isUrgent,
      this.hasErrorInQuotationItem,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.type,
      this.step,
      this.status,
      required this.farm,
      this.costCenter,
      this.paymentMethod,
      this.deliveryLocation,
      this.companies,
      this.requestItems,
      this.responsibleEmployee});

  @override
  List<Object?> get props => [
        id,
        quotationExpirationDate,
        paymentDate,
        notes,
        isUrgent,
        hasErrorInQuotationItem,
        createdAt,
        updatedAt,
        deletedAt,
        type,
        step,
        status,
        farm,
        costCenter,
        paymentMethod,
        deliveryLocation,
        companies,
        requestItems,
        responsibleEmployee,
      ];
}
