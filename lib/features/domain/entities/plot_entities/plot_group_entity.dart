import 'package:equatable/equatable.dart';

class PlotGroupEntity extends Equatable {
  final int id;
  final String name;

  const PlotGroupEntity({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
