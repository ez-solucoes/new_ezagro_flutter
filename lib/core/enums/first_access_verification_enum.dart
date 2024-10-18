// [ PENDING, ACTIVE, PASSWORD_CHANGE ]

enum FirstAccessVerificationEnum {
  pending,
  active,
  passwordChange,
}

firstAccessVerificationEnum(String firstAccessVerification) {
  switch (firstAccessVerification) {
    case 'PENDING':
      return FirstAccessVerificationEnum.pending;
    case 'ACTIVE':
      return FirstAccessVerificationEnum.active;
    case 'PASSWORD_CHANGE':
      return FirstAccessVerificationEnum.passwordChange;
  }
}

firstAccessVerificationString(type) {
  switch (type) {
    case FirstAccessVerificationEnum.pending:
      return 'PENDING';
    case FirstAccessVerificationEnum.active:
      return 'ACTIVE';
    case FirstAccessVerificationEnum.passwordChange:
      return 'PASSWORD_CHANGE';
    default:
      return '';
  }
}
