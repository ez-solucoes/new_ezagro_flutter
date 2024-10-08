import 'package:equatable/equatable.dart';

class ContractPaymentPeriodicityEntity extends Equatable {
  final int id;
  final String name;
  final Map<String, dynamic>? percentageByDate;
  final String description;

  const ContractPaymentPeriodicityEntity(
    this.percentageByDate, {
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        percentageByDate,
        description,
      ];
}
