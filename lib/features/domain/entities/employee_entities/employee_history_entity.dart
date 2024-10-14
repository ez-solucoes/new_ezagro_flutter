import 'package:equatable/equatable.dart';

class EmployeeHistoryEntity extends Equatable {
  final int employeeHistoryId;
  final int employeeId;
  final double baseSalary;
  final double combinedSalary;
  final double variedSalary;
  final double alimonyPercentage;
  final double alimonyPercentageWithdrawFgts;
  final String cpf;
  final String pisPasep;
  final String timeRegisterCode;
  final String insuranceCode;
  final String valueTicket;
  final String ceiNumber;
  final String healthPlanCode;
  final String function;
  final String motherName;
  final int numberRegistration;
  final String dtAdmission;
  final String dtDismissal;
  final String dtBirth;
  final int additionalUnhealthy;
  final int additionalDanger;
  final int additionalTrustPosition;
  final String unionLaborCode;
  final String employeeName;

  const EmployeeHistoryEntity({
    required this.employeeHistoryId,
    required this.employeeId,
    required this.baseSalary,
    required this.combinedSalary,
    required this.variedSalary,
    required this.alimonyPercentage,
    required this.alimonyPercentageWithdrawFgts,
    required this.cpf,
    required this.pisPasep,
    required this.timeRegisterCode,
    required this.insuranceCode,
    required this.valueTicket,
    required this.ceiNumber,
    required this.healthPlanCode,
    required this.function,
    required this.motherName,
    required this.numberRegistration,
    required this.dtAdmission,
    required this.dtDismissal,
    required this.dtBirth,
    required this.additionalUnhealthy,
    required this.additionalDanger,
    required this.additionalTrustPosition,
    required this.unionLaborCode,
    required this.employeeName,
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
