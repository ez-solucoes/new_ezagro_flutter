class HttpResponse {
  HttpResponse({
    required this.status,
    this.message,
    this.data,
    this.path,
  });

  final int status;
  final String? message;
  final dynamic data;
  final String? path;

  HttpResponse copyWith({
    int? statusCode,
    String? statusMessage,
    dynamic data,
    String? path,
  }) {
    return HttpResponse(
      status: statusCode ?? status,
      message: statusMessage ?? message,
      data: data ?? this.data,
      path: path ?? path,
    );
  }
}
