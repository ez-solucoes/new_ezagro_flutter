import 'package:equatable/equatable.dart';

class OutsourceStatusEntity extends Equatable {
  final int id;
  final String name;

  const OutsourceStatusEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
