import 'package:equatable/equatable.dart';

class EmployeeMeasureAndPerformanceEntity extends Equatable {
  final int id;
  final String? setGoals;
  final String? dtGoalEvaluationStart;
  final String? dtGoalEvaluationEnd;
  final String? goalPerformance;
  final double? bonusesReceived;

  const EmployeeMeasureAndPerformanceEntity({
    required this.id,
    this.setGoals,
    this.dtGoalEvaluationStart,
    this.dtGoalEvaluationEnd,
    this.goalPerformance,
    this.bonusesReceived,
  });

  @override
  List<Object?> get props => [
        id,
        setGoals,
        dtGoalEvaluationStart,
        dtGoalEvaluationEnd,
        goalPerformance,
        bonusesReceived,
      ];
}
