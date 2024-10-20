import 'package:equatable/equatable.dart';

import 'contract_entity.dart';
import 'contract_payment_method_entity.dart';
import 'contract_payment_periodicity_entity.dart';

class ContractItemEntity extends Equatable {
  final int id;
  final String name;
  final double unitPrice;
  final String dtPayment;
  final ContractPaymentMethodEntity paymentMethod;
  final ContractPaymentPeriodicityEntity paymentPeriodicity;
  final ContractEntity contract;

  const ContractItemEntity({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.dtPayment,
    required this.paymentMethod,
    required this.paymentPeriodicity,
    required this.contract,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        unitPrice,
        dtPayment,
        paymentMethod,
        paymentPeriodicity,
        contract,
      ];
}
