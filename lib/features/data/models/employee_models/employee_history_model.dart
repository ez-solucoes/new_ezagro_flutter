import 'dart:convert';

import '../../../domain/entities/employee_entities/employee_history_entity.dart';


class EmployeeHistoryModel extends EmployeeHistoryEntity {
  const EmployeeHistoryModel({
    required super.employeeHistoryId,
    required super.employeeId,
    required super.baseSalary,
    required super.combinedSalary,
    required super.variedSalary,
    required super.alimonyPercentage,
    required super.alimonyPercentageWithdrawFgts,
    required super.cpf,
    required super.pisPasep,
    required super.timeRegisterCode,
    required super.insuranceCode,
    required super.valueTicket,
    required super.ceiNumber,
    required super.healthPlanCode,
    required super.function,
    required super.motherName,
    required super.numberRegistration,
    required super.dtAdmission,
    required super.dtDismissal,
    required super.dtBirth,
    required super.additionalUnhealthy,
    required super.additionalDanger,
    required super.additionalTrustPosition,
    required super.unionLaborCode,
    required super.employeeName,
  });

  Map<String, dynamic> toMap() => {
    'employeeHistoryId': employeeHistoryId,
    'employeeId': employeeId,
    'baseSalary': baseSalary,
    'combinedSalary': combinedSalary,
    'variedSalary': variedSalary,
    'alimonyPercentage': alimonyPercentage,
    'alimonyPercentageWithdrawFgts': alimonyPercentageWithdrawFgts,
    'cpf': cpf,
    'pisPasep': pisPasep,
    'timeRegisterCode': timeRegisterCode,
    'insuranceCode': insuranceCode,
    'valueTicket': valueTicket,
    'ceiNumber': ceiNumber,
    'healthPlanCode': healthPlanCode,
    'function': function,
    'motherName': motherName,
    'numberRegistration': numberRegistration,
    'dtAdmission': dtAdmission,
    'dtDismissal': dtDismissal,
    'dtBirth': dtBirth,
    'additionalUnhealthy': additionalUnhealthy,
    'additionalDanger': additionalDanger,
    'additionalTrustPosition': additionalTrustPosition,
    'unionLaborCode': unionLaborCode,
    'employeeName': employeeName,
  };

  factory EmployeeHistoryModel.fromMap(Map<String, dynamic> map) =>
      EmployeeHistoryModel(
        employeeHistoryId: map['employeeHistoryId'],
        employeeId: map['employeeId'],
        baseSalary: map['baseSalary'],
        combinedSalary: map['combinedSalary'],
        variedSalary: map['variedSalary'],
        alimonyPercentage: map['alimonyPercentage'],
        alimonyPercentageWithdrawFgts: map['alimonyPercentageWithdrawFgts'],
        cpf: map['cpf'],
        pisPasep: map['pisPasep'],
        timeRegisterCode: map['timeRegisterCode'],
        insuranceCode: map['insuranceCode'],
        valueTicket: map['valueTicket'],
        ceiNumber: map['ceiNumber'],
        healthPlanCode: map['healthPlanCode'],
        function: map['function'],
        motherName: map['motherName'],
        numberRegistration: map['numberRegistration'],
        dtAdmission: map['dtAdmission'],
        dtDismissal: map['dtDismissal'],
        dtBirth: map['dtBirth'],
        additionalUnhealthy: map['additionalUnhealthy'],
        additionalDanger: map['additionalDanger'],
        additionalTrustPosition: map['additionalTrustPosition'],
        unionLaborCode: map['unionLaborCode'],
        employeeName: map['employeeName'],
      );

  String toJson() => json.encode(toMap());

  factory EmployeeHistoryModel.fromJson(String source) =>
      EmployeeHistoryModel.fromMap(json.decode(source));

}