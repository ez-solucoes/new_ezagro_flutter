import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';

class ServerError extends ApplicationError {
  ServerError({
    super.causedBy,
    super.fingerprint,
    super.additionalInfo,
    String? friendlyMessage,
  }) : super(
          friendlyMessage: friendlyMessage ?? AppStringsPortuguese.serverErrorMessage,
        );

  @override
  String get name => throw '$ServerError';
}
