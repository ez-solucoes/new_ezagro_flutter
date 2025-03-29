import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';

import '../../../domain/entities/products_entities/product_entity.dart';
import '../agricultural_models/agricultural_input_classification_type_model.dart';
import '../business_category_models/business_category_model.dart';
import '../crop_models/crop_model.dart';
import '../measurement_unit_type_model/measurement_unit_type_model.dart';
import '../multipart_file_custom_model/multipart_file_custom_model.dart';
import '../pest_models/pest_model.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
     super.name,
     super.description,
     super.file,
     super.brand,
     super.productCode,
     super.type,
     super.agriculturalInputClassificationType,
     super.trademark,
     super.registrationHolder,
     super.active,
     super.toxicologicalClass,
     super.activeIngredient1,
     super.activeIngredient2,
     super.activeIngredient3,
     super.activeIngredient4,
     super.measurementUnit,
     super.pests,
     super.crops,
     super.attachmentNames,
     super.businessCategory,
     super.attachments,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'file': file,
        'brand': brand,
        'productCode': productCode,
        'type': (TypeModel as TypeModel).toMap(),
        'agriculturalInputClassificationType':
            agriculturalInputClassificationType
                ?.map((e) =>
                    (e as AgriculturalInputClassificationTypeModel).toMap())
                .toList(),
        'trademark': trademark,
        'registrationHolder': registrationHolder,
        'active': active,
        'toxicologicalClass': toxicologicalClass,
        'activeIngredient1': activeIngredient1,
        'activeIngredient2': activeIngredient2,
        'activeIngredient3': activeIngredient3,
        'activeIngredient4': activeIngredient4,
        'measurementUnit':
            (measurementUnit as MeasurementUnitTypeModel).toMap(),
        'pests': pests?.map((e) => (e as PestModel).toMap()).toList(),
        'crops': crops?.map((e) => (e as CropModel).toMap()).toList(),
        'attachmentNames': attachmentNames,
        'businessCategory': (businessCategory as BusinessCategoryModel).toMap(),
        'attachments': attachments
            ?.map((e) => (e as MultipartFileCustomModel).toMap())
            .toList(),
      };

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
    id: map['id'],
    name: map['name'],
    description: map['description'],
    file: map['file'],
    brand: map['brand'],
    productCode: map['productCode'],
    type: map['type'] == null ? null : TypeModel.fromMap(map['type']),
    agriculturalInputClassificationType: map['agriculturalInputClassificationType'] == null
        ? null
        : List<AgriculturalInputClassificationTypeModel>.from(
        map['agriculturalInputClassificationType']?.map((x) =>
            AgriculturalInputClassificationTypeModel.fromMap(x))),
    trademark: map['trademark'],
    registrationHolder: map['registrationHolder'],
    active: map['active'],
    toxicologicalClass: map['toxicologicalClass'],
    activeIngredient1: map['activeIngredient1'],
    activeIngredient2: map['activeIngredient2'],
    activeIngredient3: map['activeIngredient3'],
    activeIngredient4: map['activeIngredient4'],
    measurementUnit: map['measurementUnit'] == null
        ? null
        : MeasurementUnitTypeModel.fromMap(map['measurementUnit']),
    pests: map['pests'] == null
        ? null
        : List<PestModel>.from(
        map['pests']?.map((x) => PestModel.fromMap(x))),
    crops: map['crops'] == null
        ? null
        : List<CropModel>.from(
        map['crops']?.map((x) => CropModel.fromMap(x))),
    attachmentNames: map['attachmentNames'] == null
        ? null
        : List<String>.from(map['attachmentNames']),
    businessCategory: map['businessCategory'] == null
        ? null
        : BusinessCategoryModel.fromMap(map['businessCategory']),
    attachments: map['attachments'] == null
        ? null
        : List<MultipartFileCustomModel>.from(
        map['attachments']?.map((x) => MultipartFileCustomModel.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
