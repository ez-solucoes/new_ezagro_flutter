import 'package:equatable/equatable.dart';

class DepartmentEntity extends Equatable {
  final int id;
  final String? name;
  final String? description;
  final List<String>? subDepartments;

  const DepartmentEntity({
    required this.id,
    this.subDepartments,
    this.name,
    this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        subDepartments,
      ];
}
