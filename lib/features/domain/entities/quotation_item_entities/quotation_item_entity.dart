import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/status_entities/status_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/suggested_product_entities/suggested_product_entity.dart';

import '../user_entities/user_entity.dart';

class QuotationItemEntity extends Equatable {
  final int id;
  final String? productValueWithTaxAndDiscount;
  final String? finalValue;
  final String? deliveryLimitDate;
  final int? warrantyLimitDays;
  final bool? isOutOfStock;
  final String? suggestedQuantity;
  final String? lastUpdateByUserDate;
  final String? notes;
  final bool? isSelectedForPurchase;
  final String? serviceStartDate;
  final String? serviceEndDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final CompanyEntity? company;
  final StatusEntity? status;
  final SuggestedProductEntity? suggestedProduct;
  final String? suggestedAgriculturalInput;
  final UserEntity? lastUpdateUser;

  const QuotationItemEntity({
    required this.id,
    this.productValueWithTaxAndDiscount,
    this.finalValue,
    this.deliveryLimitDate,
    this.warrantyLimitDays,
    this.isOutOfStock,
    this.suggestedQuantity,
    this.lastUpdateByUserDate,
    this.notes,
    this.isSelectedForPurchase,
    this.serviceStartDate,
    this.serviceEndDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.company,
    this.status,
    this.suggestedProduct,
    this.suggestedAgriculturalInput,
    this.lastUpdateUser,
  });

  @override
  List<Object?> get props => [
        id,
        productValueWithTaxAndDiscount,
        finalValue,
        deliveryLimitDate,
        warrantyLimitDays,
        isOutOfStock,
        suggestedQuantity,
        lastUpdateByUserDate,
        notes,
        isSelectedForPurchase,
        serviceStartDate,
        serviceEndDate,
        createdAt,
        updatedAt,
        deletedAt,
        company,
        status,
        suggestedProduct,
        suggestedAgriculturalInput,
        lastUpdateUser,
      ];
}
