
//[ CREATED, IN_PROGRESS, ANSWERED, COMPLETED ]

enum QuotationStatusEnum {
  created,
  inProgress,
  answered,
  completed,
}

quotationStatusEnum(String type) {
  switch (type) {
    case 'CREATED':
      return QuotationStatusEnum.created;
    case 'IN_PROGRESS':
      return QuotationStatusEnum.inProgress;
    case 'ANSWERED':
      return QuotationStatusEnum.answered;
    case 'COMPLETED':
      return QuotationStatusEnum.completed;
  }
}

quotationStatusString(type) {
  switch (type) {
    case QuotationStatusEnum.created:
      return 'CREATED';
    case QuotationStatusEnum.inProgress:
      return 'IN_PROGRESS';
    case QuotationStatusEnum.answered:
      return 'ANSWERED';
    case QuotationStatusEnum.completed:
      return 'COMPLETED';
    default:
      return '';
  }
}
