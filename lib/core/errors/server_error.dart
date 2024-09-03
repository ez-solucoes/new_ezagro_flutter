import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';

class ServerError extends ApplicationError {
  ServerError({
    super.causedBy,
    super.fingerprint,
    super.additionalInfo,
  }) : super(
          friendlyMessage: AppStrings.serverErrorMessage,
        );

  @override
  String get name => throw '$ServerError';
}
