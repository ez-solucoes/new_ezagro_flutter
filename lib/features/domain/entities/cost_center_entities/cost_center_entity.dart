import 'package:equatable/equatable.dart';
import 'cost_center_type_entity.dart';

class CostCenterEntity extends Equatable {
  final int id;
  final String? name;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final CostCenterTypeEntity? type;

  const CostCenterEntity(
      {
        required this.id,
        this.name,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.type
      });

  @override
  List<Object?> get props => [
        id,
        name,
        startDate,
        endDate,
        createdAt,
        updatedAt,
        deletedAt,
        type
      ];
}
