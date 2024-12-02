import 'dart:convert';
import '../../../domain/entities/segment_entities/segment_entity.dart';

class SegmentModel extends SegmentEntity {
  const SegmentModel({
    required super.id,
    super.name,
    super.slug,
    super.isServiceProvider,
    super.isProductSupplier,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'isServiceProvider': isServiceProvider,
      'isProductSupplier': isProductSupplier,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  factory SegmentModel.fromMap(Map<String, dynamic> map) {
    return SegmentModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      isServiceProvider: map['isServiceProvider'] as bool?,
      isProductSupplier: map['isProductSupplier'] as bool?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory SegmentModel.fromJson(String source) =>
      SegmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}