import 'package:equatable/equatable.dart';

class EmployeeMeasureAndPerformanceEntity extends Equatable{
  final int id;
  final String setGoals;
  final String dtGoalEvaluationStart;
  final String dtGoalEvaluationEnd;
  final String goalPerformance;
  final double bonusesReceived;
  
  const EmployeeMeasureAndPerformanceEntity({
    required this.id,
    required this.setGoals,
    required this.dtGoalEvaluationStart,
    required this.dtGoalEvaluationEnd,
    required this.goalPerformance,
    required this.bonusesReceived,
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