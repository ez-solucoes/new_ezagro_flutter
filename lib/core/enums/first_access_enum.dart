// [ PENDING, ACTIVE, PASSWORD_CHANGE ]

enum FirstAccessEnum {
  pending,
  active,
  passwordChange,
}

firstAccessEnum(String? firstAccessVerification) {
  switch (firstAccessVerification) {
    case 'PENDING':
      return FirstAccessEnum.pending;
    case 'ACTIVE':
      return FirstAccessEnum.active;
    case 'PASSWORD_CHANGE':
      return FirstAccessEnum.passwordChange;
  }
}

firstAccessString(type) {
  switch (type) {
    case FirstAccessEnum.pending:
      return 'PENDING';
    case FirstAccessEnum.active:
      return 'ACTIVE';
    case FirstAccessEnum.passwordChange:
      return 'PASSWORD_CHANGE';
    default:
      return '';
  }
}
