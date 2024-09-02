import 'package:new_ezagro_flutter/core/errors/application_error.dart';

class AuthenticationError extends ApplicationError {
  AuthenticationError({
    required super.friendlyMessage,
    super.causedBy,
    super.fingerprint,
    super.additionalInfo,
  });

  @override
  String get name => '$AuthenticationError';
}
