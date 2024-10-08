import 'package:equatable/equatable.dart';

class DepartmentEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final List<String>? subDepartments;

  const DepartmentEntity(
    this.subDepartments, {
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        subDepartments,
      ];
}
