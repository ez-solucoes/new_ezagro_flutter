import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/attachment_entities/attachment_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/quotation_item_entities/quotation_item_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../measurement_unit_entities/measurement_unit_type_entity.dart';

class RequestItemEntity extends Equatable {
  final int id;
  final String? serviceName;
  final String? description;
  final String? requestedQuantity;
  final bool? isSelectedForPurchase;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<AttachmentEntity>? attachments;
  final ProductEntity? product;
  final TypeEntity? type;
  final MeasurementUnitTypeEntity? measurementUnit;
  final AgriculturalInputEntity? agriculturalInput;
  final MachineryImplementEntity? machineryImplement;
  final List<QuotationItemEntity>? quotationItems;


  const RequestItemEntity({
    required this.id,
    this.serviceName,
    this.description,
    this.requestedQuantity,
    this.isSelectedForPurchase,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.attachments,
    this.product,
    this.type,
    this.measurementUnit,
    this.agriculturalInput,
    this.machineryImplement,
    this.quotationItems,
  });

  @override
  List<Object?> get props => [
    id,
    serviceName,
    description,
    requestedQuantity,
    isSelectedForPurchase,
    createdAt,
    updatedAt,
    deletedAt,
    attachments,
    product,
    type,
    measurementUnit,
    agriculturalInput,
    machineryImplement,
    quotationItems
  ];

}