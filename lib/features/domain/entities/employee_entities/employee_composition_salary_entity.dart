import 'package:equatable/equatable.dart';

class EmployeeCompositionSalaryEntity extends Equatable{
  final int id;
  final String salaryComposition;
  final String salaryCompositionReference;
  final String salaryReferenceBase;
  
  const EmployeeCompositionSalaryEntity({
    required this.id,
    required this.salaryComposition,
    required this.salaryCompositionReference,
    required this.salaryReferenceBase,
});

  @override
  List<Object?> get props => [
    id,
    salaryComposition,
    salaryCompositionReference,
    salaryReferenceBase,
  ];
}