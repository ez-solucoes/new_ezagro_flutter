import 'dart:convert';

import '../../../domain/entities/employee_entities/employee_measure_and_performance_entity.dart';

class EmployeeMeasureAndPerformanceModel
    extends EmployeeMeasureAndPerformanceEntity {
  const EmployeeMeasureAndPerformanceModel({
    required super.id,
    super.setGoals,
    super.dtGoalEvaluationStart,
    super.dtGoalEvaluationEnd,
    super.goalPerformance,
    super.bonusesReceived,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'setGoals': setGoals,
        'dtGoalEvaluationStart': dtGoalEvaluationStart,
        'dtGoalEvaluationEnd': dtGoalEvaluationEnd,
        'goalPerformance': goalPerformance,
        'bonusesReceived': bonusesReceived,
      };

  factory EmployeeMeasureAndPerformanceModel.fromMap(
          Map<String, dynamic> map) =>
      EmployeeMeasureAndPerformanceModel(
        id: map['id'],
        setGoals: map['setGoals'],
        dtGoalEvaluationStart: map['dtGoalEvaluationStart'],
        dtGoalEvaluationEnd: map['dtGoalEvaluationEnd'],
        goalPerformance: map['goalPerformance'],
        bonusesReceived: map['bonusesReceived'],
      );

  String toJson() => json.encode(toMap());

  factory EmployeeMeasureAndPerformanceModel.fromJson(String source) =>
      EmployeeMeasureAndPerformanceModel.fromMap(json.decode(source));
}
