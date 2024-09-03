import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/http_client/http_response.dart';

class HttpError {
  HttpError(
    this.type,
    this.message,
    this.response,
    this.request,
    this.error,
  );

  final HttpErrorType type;
  final String? message;
  final HttpResponse? response;
  final HttpRequest? request;
  final dynamic error;
}

enum HttpErrorType {
  /// Indica erros de conexão, como timeout, ssl handshake, etc.
  connection,

  /// Quando o servidor responde, mas com um status de erro, como 400, 404, 503...
  response,

  /// Outros tipos de erros, menos comuns de se tratar no cliente e que não
  /// entram nos casos anteriores.
  other,
}

/// Define os possíveis métodos para chamada de uma requisição HTTP.
///
/// Para alguns detalhes de cada método você pode consultar aqui:
/// https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods}
