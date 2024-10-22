import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';

class GenericError extends ApplicationError {
  GenericError({
    super.causedBy,
    super.fingerprint,
    super.additionalInfo,
  }) : super(
          friendlyMessage: AppStringsPortuguese.genericErrorMessage,
        );

  @override
  String get name => '$GenericError';
}
