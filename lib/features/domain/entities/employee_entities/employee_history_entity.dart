import 'package:equatable/equatable.dart';

class EmployeeHistoryEntity extends Equatable {
  final int employeeHistoryId;
  final int employeeId;
  final double? baseSalary;
  final double? combinedSalary;
  final double? variedSalary;
  final double? alimonyPercentage;
  final double? alimonyPercentageWithdrawFgts;
  final String? cpf;
  final String? pisPasep;
  final String? timeRegisterCode;
  final String? insuranceCode;
  final String? valueTicket;
  final String? ceiNumber;
  final String? healthPlanCode;
  final String? function;
  final String? motherName;
  final int? numberRegistration;
  final String? dtAdmission;
  final String? dtDismissal;
  final String? dtBirth;
  final int? additionalUnhealthy;
  final int? additionalDanger;
  final int? additionalTrustPosition;
  final String? unionLaborCode;
  final String? employeeName;

  const EmployeeHistoryEntity({
    required this.employeeHistoryId,
    required this.employeeId,
    this.baseSalary,
    this.combinedSalary,
    this.variedSalary,
    this.alimonyPercentage,
    this.alimonyPercentageWithdrawFgts,
    this.cpf,
    this.pisPasep,
    this.timeRegisterCode,
    this.insuranceCode,
    this.valueTicket,
    this.ceiNumber,
    this.healthPlanCode,
    this.function,
    this.motherName,
    this.numberRegistration,
    this.dtAdmission,
    this.dtDismissal,
    this.dtBirth,
    this.additionalUnhealthy,
    this.additionalDanger,
    this.additionalTrustPosition,
    this.unionLaborCode,
    this.employeeName,
  });

  @override
  List<Object?> get props => [
        employeeHistoryId,
        employeeId,
        baseSalary,
        combinedSalary,
        variedSalary,
        alimonyPercentage,
        alimonyPercentageWithdrawFgts,
        cpf,
        pisPasep,
        timeRegisterCode,
        insuranceCode,
        valueTicket,
        ceiNumber,
        healthPlanCode,
        function,
        motherName,
        numberRegistration,
        dtAdmission,
        dtDismissal,
        dtBirth,
        additionalUnhealthy,
        additionalDanger,
        additionalTrustPosition,
        unionLaborCode,
        employeeName,
      ];
}
