class HttpResponse {
  HttpResponse({
    required this.statusCode,
    this.statusMessage,
    this.data,
  });

  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  HttpResponse copyWith({
    int? statusCode,
    String? statusMessage,
    dynamic data,
  }) {
    return HttpResponse(
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
      data: data ?? this.data,
    );
  }
}