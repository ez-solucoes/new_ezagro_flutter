
//[ SCHEDULED, CANCELED, FINISHED ]

enum ScheduleStatusEnum {
  scheduled,
  canceled,
  finished,
}

scheduleStatusEnum(String type) {
  switch (type) {
    case 'SCHEDULED':
      return ScheduleStatusEnum.scheduled;
    case 'CANCELED':
      return ScheduleStatusEnum.canceled;
    case 'FINISHED':
      return ScheduleStatusEnum.finished;
  }
}

scheduleStatusString(type) {
  switch (type) {
    case ScheduleStatusEnum.scheduled:
      return 'SCHEDULED';
    case ScheduleStatusEnum.canceled:
      return 'CANCELED';
    case ScheduleStatusEnum.finished:
      return 'FINISHED';
    default:
      return '';
  }
}
