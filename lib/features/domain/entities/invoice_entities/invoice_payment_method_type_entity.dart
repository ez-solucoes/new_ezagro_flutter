import 'package:equatable/equatable.dart';

class InvoicePaymentMethodTypeEntity extends Equatable {
  final int id;
  final String description;
  final String name;

  const InvoicePaymentMethodTypeEntity({
    required this.id,
    required this.description,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        name,
      ];
}
