//[CASH, PIX, PAYMENT_SLIP, CREDIT, DEBIT ]

enum PaymentMethodEnum {
  cash,
  pix,
  paymentSlip,
  credit,
  debit,
}

paymentMethodEnum(String type) {
  switch (type) {
    case 'CASH':
      return PaymentMethodEnum.cash;
    case 'PIX':
      return PaymentMethodEnum.pix ;
    case 'PAYMENT_SLIP':
      return PaymentMethodEnum.paymentSlip;
    case 'CREDIT':
      return PaymentMethodEnum.credit;
    case 'DEBIT':
      return PaymentMethodEnum.debit;
  }
}

paymentMethodString(type) {
  switch (type) {
    case PaymentMethodEnum.cash:
      return 'CASH';
    case PaymentMethodEnum.pix :
      return 'PIX';
    case PaymentMethodEnum.paymentSlip:
      return 'PAYMENT_SLIP';
    case PaymentMethodEnum.credit:
      return 'CREDIT';
    case PaymentMethodEnum.debit:
      return 'DEBIT';
    default:
      return '';
  }
}