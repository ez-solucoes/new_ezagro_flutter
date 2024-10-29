import 'package:equatable/equatable.dart';
import '../technology_entities/technology_type_entity.dart';

class CropDiversityEntity extends Equatable {
  final int id;
  final String? name;
  final TechnologyTypeEntity? technologyType;

  const CropDiversityEntity({
    required this.id,
    this.name,
    this.technologyType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        technologyType,
      ];
}
