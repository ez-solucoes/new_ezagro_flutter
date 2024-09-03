import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';

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