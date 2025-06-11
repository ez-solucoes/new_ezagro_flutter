import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';

enum ServiceOrderTypeEnum {
  toBeStarted,
  onGoing,
  paused,
  finished,
  approvalPending,
  canceled
}

extension ServiceOrderTypeEnumExtension on ServiceOrderTypeEnum {
  static String enumServiceOrderTypeToString(type) {
    switch (type) {
      case ServiceOrderTypeEnum.toBeStarted:
        return AppStringsPortuguese.toBeStartedSOEnum;
      case ServiceOrderTypeEnum.onGoing:
        return AppStringsPortuguese.onGoingSOEnum;
      case ServiceOrderTypeEnum.paused:
        return AppStringsPortuguese.pausedSOEnum;
      case ServiceOrderTypeEnum.finished:
        return AppStringsPortuguese.finishedOSEnum;
      case ServiceOrderTypeEnum.approvalPending:
        return AppStringsPortuguese.approvalPendingOSWithLineBreakEnum;
      case ServiceOrderTypeEnum.canceled:
        return AppStringsPortuguese.canceledOSEnum;
      default:
        return '';
    }
  }

  static ServiceOrderTypeEnum getEnumServiceOrderTypeFromString(type) {
    switch (type) {
      case AppStringsPortuguese.toBeStartedSOKey || AppStringsPortuguese.toBeStartedSOEnum:
        return ServiceOrderTypeEnum.toBeStarted;
      case AppStringsPortuguese.onGoingSOKey || AppStringsPortuguese.onGoingSOEnum:
        return ServiceOrderTypeEnum.onGoing;
      case AppStringsPortuguese.pausedSOKey || AppStringsPortuguese.pausedSOEnum:
        return ServiceOrderTypeEnum.paused;
      case AppStringsPortuguese.finishedOSKey || AppStringsPortuguese.finishedOSEnum:
        return ServiceOrderTypeEnum.finished;
      case AppStringsPortuguese.approvalPendingOSKey ||
            AppStringsPortuguese.approvalPendingOSWithLineBreakEnum:
        return ServiceOrderTypeEnum.approvalPending;
      case AppStringsPortuguese.canceledOSKey || AppStringsPortuguese.canceledOSEnum:
        return ServiceOrderTypeEnum.canceled;
      default:
        return ServiceOrderTypeEnum.toBeStarted;
    }
  }
}
