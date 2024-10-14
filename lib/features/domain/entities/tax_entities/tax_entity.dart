import 'package:equatable/equatable.dart';

class TaxEntity extends Equatable {
  final int id;
  final double icmsBase;
  final double icmsValue;
  final double icmsStValue;
  final double icmsRate;
  final double ipiValue;
  final double ipiRate;

  const TaxEntity({
    required this.id,
    required this.icmsBase,
    required this.icmsValue,
    required this.icmsStValue,
    required this.icmsRate,
    required this.ipiValue,
    required this.ipiRate,
  });

  @override
  List<Object?> get props => [
        id,
        icmsBase,
        icmsValue,
        icmsStValue,
        icmsRate,
        ipiValue,
        ipiRate,
      ];
}
