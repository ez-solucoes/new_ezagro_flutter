import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/agricultural_input_models/agricultural_input_model.dart';
import 'package:new_ezagro_flutter/features/data/models/attachment_models/attachment_model.dart';
import 'package:new_ezagro_flutter/features/data/models/measurement_unit_type_model/measurement_unit_type_model.dart';
import 'package:new_ezagro_flutter/features/data/models/quotation_item_models/quotation_item_model.dart';

import '../../../domain/entities/request_items_entities/request_item_entity.dart';
import '../../../domain/entities/type_entities/type_entity.dart';
import '../machinery_implement_models/machinery_implement_model.dart';
import '../products_models/product_model.dart';

class RequestItemModel extends RequestItemEntity{
  const RequestItemModel({
    required super.id,
    super.serviceName,
    super.description,
    super.requestedQuantity,
    super.isSelectedForPurchase,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.attachments,
    super.product,
    super.type,
    super.measurementUnit,
    super.agriculturalInput,
    super.machineryImplement,
    super.quotationItems,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serviceName': serviceName,
      'description': description,
      'requestedQuantity': requestedQuantity,
      'isSelectedForPurchase': isSelectedForPurchase,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'attachments': attachments,
      'product': product,
      'type': type,
      'measurementUnit': measurementUnit,
      'agriculturalInput': agriculturalInput,
      'machineryImplement': machineryImplement,
      'quotationItems': quotationItems,
    };
  }

  factory RequestItemModel.fromMap(Map<String, dynamic> map) {
    return RequestItemModel(
      id: map['id'] as int,
      serviceName: map['serviceName'] == null ? null : map['serviceName'] as String,
      description: map['description'] as String?,
      requestedQuantity: map['requestedQuantity'] as String?,
        isSelectedForPurchase: map['isSelectedForPurchase'] as bool?,
        createdAt: map['createdAt'] as String?,
        updatedAt: map['updatedAt'] as String?,
        deletedAt: map['deletedAt'] as String?,
        attachments: map['attachments'] == null
            ? null
            : (map['attachments'] as List<dynamic>)
            .map((item) => AttachmentModel.fromMap(item))
            .toList(),
        product: map['product'] == null ? null : ProductModel.fromMap(map['product']),
        type: map['type'] as TypeEntity?,
        measurementUnit: map['measurementUnit'] as MeasurementUnitTypeModel?,
        agriculturalInput: map['agriculturalInput'] == null ? null : AgriculturalInputModel.fromMap(map['agriculturalInput']),
        machineryImplement: map['machineryImplement'] == null ? null : MachineryImplementModel.fromMap(map['machineryImplement']),
        quotationItems: map['quotationItems'] == null
      ? null
      : (map['quotationItems'] as List<dynamic>).map((item) => QuotationItemModel.fromMap(item)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestItemModel.fromJson(String source) =>
      RequestItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

}