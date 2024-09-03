import 'package:new_ezagro_flutter/consts/app_strings.dart';

enum ServiceOrderTypeEnum {
  toBeStarted,
  onGoing,
  paused,
  finished,
  approvalPending,
  canceled
}

extension ServiceOrderTypeEnumExtension on ServiceOrderTypeEnum {
  static enumServiceOrderTypeToString(type) {
    switch (type) {
      case ServiceOrderTypeEnum.toBeStarted:
        return AppStrings.toBeStartedSOEnum;
      case ServiceOrderTypeEnum.onGoing:
        return AppStrings.onGoingSOEnum;
      case ServiceOrderTypeEnum.paused:
        return AppStrings.pausedSOEnum;
      case ServiceOrderTypeEnum.finished:
        return AppStrings.finishedOSEnum;
      case ServiceOrderTypeEnum.approvalPending:
        return AppStrings.approvalPendingOSEnum;
      case ServiceOrderTypeEnum.canceled:
        return AppStrings.canceledOSEnum;
      default:
        return '';
    }
  }

  static getEnumServiceOrderTypeFromString(type) {
    switch (type) {
      case AppStrings.toBeStartedSOEnum:
        return ServiceOrderTypeEnum.toBeStarted;
      case AppStrings.onGoingSOEnum:
        return ServiceOrderTypeEnum.onGoing;
      case AppStrings.pausedSOEnum:
        return ServiceOrderTypeEnum.paused;
      case AppStrings.finishedOSEnum:
        return ServiceOrderTypeEnum.finished;
      case AppStrings.approvalPendingOSEnum:
        return ServiceOrderTypeEnum.approvalPending;
      case AppStrings.canceledOSEnum:
        return ServiceOrderTypeEnum.canceled;
      default:
        return '';
    }
  }
}
