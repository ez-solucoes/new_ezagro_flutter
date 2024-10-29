import 'dart:convert';

import '../../../domain/entities/employee_entities/employee_history_entity.dart';


class EmployeeHistoryModel extends EmployeeHistoryEntity {
  const EmployeeHistoryModel({
    super.employeeHistoryId,
    super.employeeId,
    super.baseSalary,
    super.combinedSalary,
    super.variedSalary,
    super.alimonyPercentage,
    super.alimonyPercentageWithdrawFgts,
    super.cpf,
    super.pisPasep,
    super.timeRegisterCode,
    super.insuranceCode,
    super.valueTicket,
    super.ceiNumber,
    super.healthPlanCode,
    super.function,
    super.motherName,
    super.numberRegistration,
    super.dtAdmission,
    super.dtDismissal,
    super.dtBirth,
    super.additionalUnhealthy,
    super.additionalDanger,
    super.additionalTrustPosition,
    super.unionLaborCode,
    super.employeeName,
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