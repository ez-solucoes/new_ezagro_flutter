//[ IN_ANALYSIS, PENDING, COMPLETED ]

enum PurchaseRequestStatusEnum {
  inAnalysis,
  pending,
  completed,
}

purchaseRequestStatusEnum(String type) {
  switch (type) {
    case 'IN_ANALYSIS':
      return PurchaseRequestStatusEnum.inAnalysis;
    case 'PENDING':
      return PurchaseRequestStatusEnum.pending;
    case 'COMPLETED':
      return PurchaseRequestStatusEnum.completed;
  }
}

purchaseRequestStatusString(type) {
  switch (type) {
    case PurchaseRequestStatusEnum.inAnalysis:
      return 'IN_ANALYSIS';
    case PurchaseRequestStatusEnum.pending:
      return 'PENDING';
    case PurchaseRequestStatusEnum.completed:
      return 'COMPLETED';
    default:
      return '';
  }
}
