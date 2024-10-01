import 'package:equatable/equatable.dart';

import '../account_entities/account_entity.dart';
import 'invoice_payment_method_type_entity.dart';

class InvoicePaymentMethodEntity extends Equatable {
  final int number;
  final String dueDate;
  final int value;
  final InvoicePaymentMethodTypeEntity invoicePaymentMethodType;
  final AccountEntity account;

  const InvoicePaymentMethodEntity({
    required this.number,
    required this.dueDate,
    required this.value,
    required this.invoicePaymentMethodType,
    required this.account,
  });

  @override
  List<Object?> get props => [
        number,
        dueDate,
        value,
        invoicePaymentMethodType,
        account,
      ];
}
