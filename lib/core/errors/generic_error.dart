import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings.dart';

class GenericError extends ApplicationError {
  GenericError({
    super.causedBy,
    super.fingerprint,
    super.additionalInfo,
  }) : super(
          friendlyMessage: AppStrings.genericErrorMessage,
        );

  @override
  String get name => '$GenericError';
}
