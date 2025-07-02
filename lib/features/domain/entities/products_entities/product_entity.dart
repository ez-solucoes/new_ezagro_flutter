import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../agricultural_entities/agricultural_input_classification_type_entity.dart';
import '../business_category_entities/business_category_entity.dart';
import '../crop_entities/crop_entity.dart';
import '../measurement_unit_entities/measurement_unit_type_entity.dart';
import '../multipart_file_custom_entities/multipart_file_custom_entity.dart';
import '../pest_entities/pest_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final String? name;
  final String? description;
  final String? file;
  final String? brand;
  final String? productCode;
  final TypeEntity? type;
  final List<AgriculturalInputClassificationTypeEntity>? agriculturalInputClassificationType;
  final String? trademark;
  final String? registrationHolder;
  final bool? active;
  final String? toxicologicalClass;
  final String? activeIngredient1;
  final String? activeIngredient2;
  final String? activeIngredient3;
  final String? activeIngredient4;
  final MeasurementUnitTypeEntity? measurementUnit;
  final List<PestEntity>? pests;
  final List<CropEntity>? crops;
  final List<String>? attachmentNames;
  final BusinessCategoryEntity? businessCategory;
  final List<MultipartFileCustomEntity>? attachments;

  const ProductEntity({
    this.agriculturalInputClassificationType,
    this.trademark,
    this.registrationHolder,
    this.toxicologicalClass,
    this.activeIngredient1,
    this.activeIngredient2,
    this.activeIngredient3,
    this.activeIngredient4,
    this.measurementUnit,
    this.pests,
    this.crops,
    required this.id,
    this.name,
    this.description,
    this.brand,
    this.productCode,
    this.type,
    this.file,
    this.businessCategory,
    this.attachmentNames,
    this.attachments,
    this.active,
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
        measurementUnit,
        pests,
        crops,
        id,
        name,
        description,
        brand,
        productCode,
        type,
        file,
        businessCategory,
        attachmentNames,
        attachments,
        active,
      ];
}
