// [ IN_ANALYSIS, PENDING, COMPLETED ]

enum StatusEnum {
  inAnalysis,
  pending,
  completed,
}

statusEnum(String status) {
  switch (status) {
    case 'IN_ANALYSIS':
      return StatusEnum.inAnalysis;
    case 'PENDING':
      return StatusEnum.pending;
    case 'COMPLETED':
      return StatusEnum.completed;
  }
}

statusString(type) {
  switch (type) {
    case StatusEnum.inAnalysis:
      return 'IN_ANALYSIS';
    case StatusEnum.pending:
      return 'PENDING';
    case StatusEnum.completed:
      return 'COMPLETED';
    default:
      return '';
  }
}
