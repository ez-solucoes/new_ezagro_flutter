import '../../../domain/entities/pix_entities/pix_type_entity.dart';

class PixTypeModel extends PixTypeEntity {const PixTypeModel({
  required super.id,
  required super.name,
  required super.description,
  required super.active,
});

factory PixTypeModel.fromJson(Map<String, dynamic> json) => PixTypeModel(
  id: json['id'],
  name: json['name'],
  description: json['description'],
  active: json['active'],
);

Map<String, dynamic> toJson() => {
  'id': id,
  'name': name,
  'description': description,
  'active': active,
};

Map<String, dynamic> toMap() => {
  'id': id,
  'name': name,
  'description': description,
  'active': active,
};

factory PixTypeModel.fromMap(Map<String, dynamic> map) => PixTypeModel(
  id: map['id'],
  name: map['name'],
  description: map['description'],
  active: map['active'],
);
}