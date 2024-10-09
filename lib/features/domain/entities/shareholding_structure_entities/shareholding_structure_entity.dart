import 'package:equatable/equatable.dart';

class ShareHoldingStructureEntity extends Equatable {
  final int id;
  final String? name;
  final String? cpf;
  final double? percentage;

  const ShareHoldingStructureEntity({
    required this.id,
    this.name,
    this.cpf,
    this.percentage,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        cpf,
        percentage,
      ];
}
