class HttpRequest {
  HttpRequest({
    required this.method,
    required this.path,
    this.id,
    this.headers,
    this.queryParams,
    this.payload,
  });

  final HttpRequestMethod method;
  final String path;
  final String? id;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? queryParams;
  final dynamic payload;

  /// O método GET solicita a representação de um recurso específico.
  /// Requisições utilizando o método GET devem retornar apenas dados.
  factory HttpRequest.get({
    required String path,
    final id,
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
  }) {
    final modifiedPath = '$path/$id';
    return HttpRequest(
      method: HttpRequestMethod.get,
      path: id != null ? modifiedPath : path,
      headers: headers,
      queryParams: queryParams,
    );
  }

  /// O método HEAD solicita uma resposta de forma idêntica ao método GET,
  /// porém sem conter o corpo da resposta.
  factory HttpRequest.head({
    required String path,
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic payload,
  }) {
    return HttpRequest(
      method: HttpRequestMethod.head,
      path: path,
      headers: headers,
      queryParams: queryParams,
      payload: payload,
    );
  }

  /// O método POST é utilizado para submeter uma entidade a um recurso
  /// específico, frequentemente causando uma mudança no estado do recurso
  /// ou efeitos colaterais no servidor.
  factory HttpRequest.post({
    required String path,
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic payload,
  }) {
    return HttpRequest(
      method: HttpRequestMethod.post,
      path: path,
      headers: headers,
      queryParams: queryParams,
      payload: payload,
    );
  }

  /// O método PUT substitui todas as atuais representações do recurso
  /// de destino pela carga de dados ([payload]) da requisição.
  factory HttpRequest.put({
    required String path,
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic payload,
  }) {
    return HttpRequest(
      method: HttpRequestMethod.put,
      path: path,
      headers: headers,
      queryParams: queryParams,
      payload: payload,
    );
  }

  /// O método DELETE remove um recurso específico.
  factory HttpRequest.delete({
    required String path,
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic payload,
  }) {
    return HttpRequest(
      method: HttpRequestMethod.delete,
      path: path,
      headers: headers,
      queryParams: queryParams,
      payload: payload,
    );
  }

  /// O método CONNECT estabelece um túnel para o servidor identificado
  /// pelo recurso de destino.
  factory HttpRequest.connect({
    required String path,
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic payload,
  }) {
    return HttpRequest(
      method: HttpRequestMethod.connect,
      path: path,
      headers: headers,
      queryParams: queryParams,
      payload: payload,
    );
  }

  /// O método OPTIONS é usado para descrever as opções de comunicação
  /// com o recurso de destino.
  factory HttpRequest.options({
    required String path,
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
  }) {
    return HttpRequest(
      method: HttpRequestMethod.options,
      path: path,
      headers: headers,
      queryParams: queryParams,
    );
  }

  /// O método TRACE executa um teste de chamada loop-back junto com o caminho
  /// para o recurso de destino.
  factory HttpRequest.trace({
    required String path,
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
  }) {
    return HttpRequest(
      method: HttpRequestMethod.trace,
      path: path,
      headers: headers,
      queryParams: queryParams,
    );
  }

  /// O método PATCH é utilizado para aplicar modificações parciais em um recurso.
  factory HttpRequest.patch({
    required String path,
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic payload,
    final id,
    final sufix
  }) {
    final modifiedPath = '$path/$id/$sufix';
    return HttpRequest(
      method: HttpRequestMethod.patch,
      path: (id != null  && sufix != null) ? modifiedPath : path,
      headers: headers,
      queryParams: queryParams,
      payload: payload,
    );
  }
}

enum HttpRequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

extension HttpRequestMethoExtension on HttpRequestMethod {
  String get name {
    switch (this) {
      case HttpRequestMethod.get:
        return 'GET';
      case HttpRequestMethod.head:
        return 'HEAD';
      case HttpRequestMethod.post:
        return 'POST';
      case HttpRequestMethod.put:
        return 'PUT';
      case HttpRequestMethod.delete:
        return 'DELETE';
      case HttpRequestMethod.connect:
        return 'CONNECT';
      case HttpRequestMethod.options:
        return 'OPTIONS';
      case HttpRequestMethod.trace:
        return 'TRACE';
      case HttpRequestMethod.patch:
        return 'PATCH';
      }
  }
}
