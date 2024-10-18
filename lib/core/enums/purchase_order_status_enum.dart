//[ IN_ANALYSIS, PENDING, COMPLETED ]

enum PurchaseOrderStatusEnum {
  inAnalysis,
  pending,
  completed,
}

purchaseOrderStatus(String type) {
  switch (type) {
    case 'IN_ANALYSIS':
      return PurchaseOrderStatusEnum.inAnalysis;
    case 'PENDING':
      return PurchaseOrderStatusEnum.pending;
    case 'COMPLETED':
      return PurchaseOrderStatusEnum.completed;
  }
}

plantingCycleString(type) {
  switch (type) {
    case PurchaseOrderStatusEnum.inAnalysis:
      return 'IN_ANALYSIS';
    case PurchaseOrderStatusEnum.pending:
      return 'PENDING';
    case PurchaseOrderStatusEnum.completed:
      return 'COMPLETED';
    default:
      return '';
  }
}
