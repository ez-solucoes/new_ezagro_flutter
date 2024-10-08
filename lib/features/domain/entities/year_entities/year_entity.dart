import 'package:equatable/equatable.dart';

class YearEntity extends Equatable {
  final int value;
  final bool leap;

  const YearEntity({
    required this.value,
    required this.leap,
  });

  @override
  List<Object?> get props => [
    value,
    leap,
  ];
}
