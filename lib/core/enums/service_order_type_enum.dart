import 'package:new_ezagro_flutter/design_system/strings/app_strings.dart';

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
        return AppStrings.approvalPendingOSWithLineBreakEnum;
      case ServiceOrderTypeEnum.canceled:
        return AppStrings.canceledOSEnum;
      default:
        return '';
    }
  }

  static getEnumServiceOrderTypeFromString(type) {
    switch (type) {
      case AppStrings.toBeStartedSOKey || AppStrings.toBeStartedSOEnum:
        return ServiceOrderTypeEnum.toBeStarted;
      case AppStrings.onGoingSOKey || AppStrings.onGoingSOEnum:
        return ServiceOrderTypeEnum.onGoing;
      case AppStrings.pausedSOKey || AppStrings.pausedSOEnum:
        return ServiceOrderTypeEnum.paused;
      case AppStrings.finishedOSKey || AppStrings.finishedOSEnum:
        return ServiceOrderTypeEnum.finished;
      case AppStrings.approvalPendingOSKey ||
            AppStrings.approvalPendingOSWithLineBreakEnum:
        return ServiceOrderTypeEnum.approvalPending;
      case AppStrings.canceledOSKey || AppStrings.canceledOSEnum:
        return ServiceOrderTypeEnum.canceled;
      default:
        return ServiceOrderTypeEnum.toBeStarted;
    }
  }
}
