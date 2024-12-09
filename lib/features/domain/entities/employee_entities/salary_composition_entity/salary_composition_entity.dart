import 'package:equatable/equatable.dart';

class SalaryCompositionEntity extends Equatable {
  final int id;
  final String? composition;
  final double? compositionReference;
  final int? baseReferenceId;
  final int? employeeId;

  const SalaryCompositionEntity({
    required this.id,
    this.composition,
    this.compositionReference,
    this.baseReferenceId,
    this.employeeId,
  });

  @override
  List<Object?> get props => [
    id,
    composition,
    compositionReference,
    baseReferenceId,
    employeeId,
  ];
}