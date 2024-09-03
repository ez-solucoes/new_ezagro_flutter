import 'package:new_ezagro_flutter/consts/app_strings.dart';
import 'package:new_ezagro_flutter/core/errors/server_error.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/http_client/http_response.dart';

ServerError mountServerErrorInstance({
  required HttpRequest request,
  required HttpResponse response,
  String? friendlyMessage,
}) {
  final causedBy = StringBuffer()
    ..write(AppStrings.serverErrorCausedBy)..write(request.method.name)..write(
        ' on ${request.path}')..write(
        ' with status code ${response.statusCode}');
  return ServerError(
    causedBy: causedBy.toString(),
    additionalInfo: response.data?.toString(),
    friendlyMessage: friendlyMessage ??
        (response.statusCode == 401
            ? _replaceServerErrorMessage(response.data.toString())
            : null),
  );
}

String _replaceServerErrorMessage(String serverErrorMessage) {
  if (serverErrorMessage.toLowerCase().contains("unauthorized")) {
    return AppStrings.reautenticationNeededErrorMessage;
  }
  return serverErrorMessage;
}

T mountModelInstanceFromResponse<T>({
  required HttpResponse response,
  required T Function(Map<String, dynamic>) fromMap,
  required T Function(String) fromJson,
  String? mountMapDataFromNodeName,
}) {
  final data = response.data;
  if (data is Map) {
    if (mountMapDataFromNodeName != null && data.containsKey(mountMapDataFromNodeName)) {
      return fromMap(data[mountMapDataFromNodeName]);
    }
    return fromMap(data as Map<String, dynamic>);
  }
  return fromJson(data);
}

T mountListModelInstanceFromResponse<T>({
  required HttpResponse response,
  required T Function(List) fromListMap,
  required T Function(String) fromJsonList,
  String? mountMapDataFromNodeName,
}) {
  final data = response.data;
  if (data is List ||
      (mountMapDataFromNodeName != null &&
          data is Map &&
          data.containsKey(mountMapDataFromNodeName))) {
    return fromListMap(
      data is List ? data : ((data as Map)[mountMapDataFromNodeName] as List),
    );
  }
  return fromJsonList(data);
}
