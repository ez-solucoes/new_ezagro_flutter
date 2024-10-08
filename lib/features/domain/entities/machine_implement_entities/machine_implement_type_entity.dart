import 'package:equatable/equatable.dart';

class MachineImplementTypeEntity extends Equatable {
  final int id;
  final String name;
  final String machineImplementType;

  const MachineImplementTypeEntity({
    required this.id,
    required this.name,
    required this.machineImplementType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        machineImplementType,
      ];
}
