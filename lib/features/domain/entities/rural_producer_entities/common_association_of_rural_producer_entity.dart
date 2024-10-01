import 'package:equatable/equatable.dart';

class CommonAssociationOfRuralProducerEntity extends Equatable {
  final int id;
  final String name;
  final String cpf;
  final bool active;

  const CommonAssociationOfRuralProducerEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.active,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        cpf,
        active,
      ];
}
