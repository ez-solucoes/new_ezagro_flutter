//[ TO_START, IN_PROGRESS, SUSPENDED, COMPLETED, PENDING_APPROVAL, CANCELLED ]

enum PlotStatusEnum {
  toStart,
  inProgress,
  suspended,
  completed,
  pendingApproval,
  cancelled,
}

plotStatusEnum(String type) {
  switch (type) {
    case 'TO_START':
      return PlotStatusEnum.toStart;
    case 'IN_PROGRESS':
      return PlotStatusEnum.inProgress;
    case 'SUSPENDED':
      return PlotStatusEnum.suspended;
    case 'COMPLETED':
      return PlotStatusEnum.completed;
    case 'PENDING_APPROVAL':
      return PlotStatusEnum.pendingApproval;
    case 'CANCELLED':
      return PlotStatusEnum.cancelled;
  }
}

plotStatusString(type) {
  switch (type) {
    case PlotStatusEnum.toStart:
      return 'TO_START';
    case PlotStatusEnum.inProgress:
      return 'IN_PROGRESS';
    case PlotStatusEnum.suspended:
      return 'SUSPENDED';
    case PlotStatusEnum.completed:
      return 'COMPLETED';
    case PlotStatusEnum.pendingApproval:
      return 'PENDING_APPROVAL';
    case PlotStatusEnum.cancelled:
      return 'CANCELLED';
    default:
      return '';
  }
}
