//[ TO_START, IN_PROGRESS, SUSPENDED, COMPLETED, PENDING_APPROVAL, CANCELLED ]

enum FieldServiceOrderStatusEnum {
  toStart,
  inProgress,
  suspended,
  completed,
  pendingApproval,
  cancelled,
}

fieldServiceOrderStatusEnum(String type) {
  switch (type) {
    case 'TO_START':
      return FieldServiceOrderStatusEnum.toStart;
    case 'IN_PROGRESS':
      return FieldServiceOrderStatusEnum.inProgress;
    case 'SUSPENDED':
      return FieldServiceOrderStatusEnum.suspended;
    case 'COMPLETED':
      return FieldServiceOrderStatusEnum.completed;
    case 'PENDING_APPROVAL':
      return FieldServiceOrderStatusEnum.pendingApproval;
    case 'CANCELLED':
      return FieldServiceOrderStatusEnum.cancelled;
  }
}

fieldServiceOrderStatusString(type) {
  switch (type) {
    case FieldServiceOrderStatusEnum.toStart:
      return 'TO_START';
    case FieldServiceOrderStatusEnum.inProgress:
      return 'IN_PROGRESS';
    case FieldServiceOrderStatusEnum.suspended:
      return 'SUSPENDED';
    case FieldServiceOrderStatusEnum.completed:
      return 'COMPLETED';
    case FieldServiceOrderStatusEnum.pendingApproval:
      return 'PENDING_APPROVAL';
    case FieldServiceOrderStatusEnum.cancelled:
      return 'CANCELLED';
    default:
      return '';
  }
}