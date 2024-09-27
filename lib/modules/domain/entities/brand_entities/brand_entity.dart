import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  final int id;
  final String name;

  const BrandEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
