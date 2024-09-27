// [ COMPANY, RURAL_PRODUCER ]

enum IssuerRecipientTypeEnum {
  company,
  ruralProducer,
}

issuerRecipientTypeEnum(String issuerRecipientType) {
  switch (issuerRecipientType) {
    case 'COMPANY':
      return IssuerRecipientTypeEnum.company;
    case 'RURAL_PRODUCER':
      return IssuerRecipientTypeEnum.ruralProducer;
  }
}

issuerRecipientTypeString(type) {
  switch (type) {
    case IssuerRecipientTypeEnum.company:
      return 'COMPANY';
    case IssuerRecipientTypeEnum.ruralProducer:
      return 'RURAL_PRODUCER';
    default:
      return '';
  }
}
