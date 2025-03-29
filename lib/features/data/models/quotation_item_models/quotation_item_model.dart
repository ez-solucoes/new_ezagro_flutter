import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/company_models/company_model.dart';
import 'package:new_ezagro_flutter/features/data/models/status_models/status_model.dart';
import 'package:new_ezagro_flutter/features/data/models/suggested_product_models/suggested_product_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/quotation_item_entities/quotation_item_entity.dart';

import '../user_models/user_model.dart';

class QuotationItemModel extends QuotationItemEntity {
  const QuotationItemModel({
    required super.id,
    super.productValueWithTaxAndDiscount,
    super.finalValue,
    super.deliveryLimitDate,
    super.warrantyLimitDays,
    super.isOutOfStock,
    super.suggestedQuantity,
    super.lastUpdateByUserDate,
    super.notes,
    super.isSelectedForPurchase,
    super.serviceStartDate,
    super.serviceEndDate,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.company,
    super.status,
    super.suggestedProduct,
    super.suggestedAgriculturalInput,
    super.lastUpdateUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productValueWithTaxAndDiscount': productValueWithTaxAndDiscount,
      'finalValue': finalValue,
      'deliveryLimitDate': deliveryLimitDate,
      'warrantyLimitDays': warrantyLimitDays,
      'isOutOfStock': isOutOfStock,
      'suggestedQuantity': suggestedQuantity,
      'lastUpdateByUserDate': lastUpdateByUserDate,
      'notes': notes,
      'isSelectedForPurchase': isSelectedForPurchase,
      'serviceStartDate': serviceStartDate,
      'serviceEndDate': serviceEndDate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'company': company,
      'status': status,
      'suggestedProduct': suggestedProduct,
      'suggestedAgriculturalInput': suggestedAgriculturalInput,
      'lastUpdateUser': lastUpdateUser,
    };
  }

  factory QuotationItemModel.fromMap(Map<String, dynamic> map) {
    return QuotationItemModel(
      id: map['id'] as int,
      productValueWithTaxAndDiscount: map['productValueWithTaxAndDiscount'] as String?,
      finalValue: map['finalValue'] as String?,
      deliveryLimitDate: map['deliveryLimitDate'] as String?,
      warrantyLimitDays: map['warrantyLimitDays'] as int?,
      isOutOfStock: map['isOutOfStock'] as bool?,
      suggestedQuantity: map['suggestedQuantity'] as String?,
      lastUpdateByUserDate: map['lastUpdateByUserDate'] as String?,
      notes: map['notes'] as String?,
      isSelectedForPurchase: map['isSelectedForPurchase'] as bool?,
      serviceStartDate: map['serviceStartDate'] as String?,
      serviceEndDate: map['serviceEndDate'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
      company:  CompanyModel.fromMap(map['company']),
      status: StatusModel.fromMap(map['status']),
      suggestedProduct: map['suggestedProduct'] == null ? null : SuggestedProductModel.fromMap(map['suggestedProduct']),
      suggestedAgriculturalInput: map['suggestedAgriculturalInput'] == null ? null : map['suggestedAgriculturalInput'] as String?,
      lastUpdateUser: map['lastUpdateUser'] == null ? null : UserModel.fromMap(map['lastUpdateUser']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuotationItemModel.fromJson(String source) =>
      QuotationItemModel.fromMap(json.decode(source) as Map<String, dynamic>);


}