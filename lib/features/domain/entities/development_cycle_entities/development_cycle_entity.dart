import 'package:equatable/equatable.dart';

class DevelopmentCycleEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String pestType;

  const DevelopmentCycleEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.pestType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        pestType,
      ];
}
