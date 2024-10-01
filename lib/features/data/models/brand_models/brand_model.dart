import '../../../domain/entities/brand_entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({
    required super.id,
    required super.name,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() =>{
    'id': id,
    'name': name,
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
  };

  factory BrandModel.fromMap(Map<String, dynamic> map) => BrandModel(
    id: map['id'],
    name: map['name'],
  );
}