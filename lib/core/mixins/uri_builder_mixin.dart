mixin UriBuilder {
  String mountUrl(
    String scheme,
    String baseUrl,
    String endpoint, [
    Map<String, dynamic>? queryParams,
  ]) {
    if (scheme == 'https') {
      return Uri.https(baseUrl, endpoint, queryParams).toString();
    }
    return Uri.http(baseUrl, endpoint, queryParams).toString();
  }
}
