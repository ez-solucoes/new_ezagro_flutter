import 'package:equatable/equatable.dart';

class ShareHoldingStructureEntity extends Equatable {
  final int id;
  final String name;
  final String cpf;
  final double percentage;

  const ShareHoldingStructureEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.percentage,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        cpf,
        percentage,
      ];
}
