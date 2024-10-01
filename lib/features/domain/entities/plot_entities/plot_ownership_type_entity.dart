import 'package:equatable/equatable.dart';

class PlotOwnershipTypeEntity extends Equatable {
  final int id;
  final String namme;

  const PlotOwnershipTypeEntity({
    required this.id,
    required this.namme,
  });

  @override
  List<Object?> get props => [
        id,
        namme,
      ];
}
