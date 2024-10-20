import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_type_entity.dart';

import '../agricultural_entities/agricultural_input_classification_type_entity.dart';
import '../business_category_entities/business_category_entity.dart';
import '../crop_entities/crop_entity.dart';
import '../measurement_unit_entities/measurement_unit_type_entity.dart';
import '../multipart_file_custom_entities/multipart_file_custom_entity.dart';
import '../pest_entities/pest_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String file;
  final String brand;
  final String productCode;
  final ProductTypeEntity productType;
  final List<AgriculturalInputClassificationTypeEntity>
      agriculturalInputClassificationType;
  final String trademark;
  final String registrationHolder;
  final bool active;
  final String toxicologicalClass;
  final String activeIngredient1;
  final String activeIngredient2;
  final String activeIngredient3;
  final String activeIngredient4;
  final MeasurementUnitTypeEntity measurementUnitType;
  final List<PestEntity> pests;
  final List<CropEntity> crops;
  final List<String> attachmentNames;
  final BusinessCategoryEntity businessCategory;
  final List<MultipartFileCustomEntity> attachments;

  const ProductEntity({
    required this.agriculturalInputClassificationType,
    required this.trademark,
    required this.registrationHolder,
    required this.toxicologicalClass,
    required this.activeIngredient1,
    required this.activeIngredient2,
    required this.activeIngredient3,
    required this.activeIngredient4,
    required this.measurementUnitType,
    required this.pests,
    required this.crops,
    required this.id,
    required this.name,
    required this.description,
    required this.brand,
    required this.productCode,
    required this.productType,
    required this.file,
    required this.businessCategory,
    required this.attachmentNames,
    required this.attachments,
    required this.active,
  });

  @override
  List<Object?> get props => [
        agriculturalInputClassificationType,
        trademark,
        registrationHolder,
        toxicologicalClass,
        activeIngredient1,
        activeIngredient2,
        activeIngredient3,
        activeIngredient4,
        measurementUnitType,
        pests,
        crops,
        id,
        name,
        description,
        brand,
        productCode,
        productType,
        file,
        businessCategory,
        attachmentNames,
        attachments,
        active,
      ];
}
