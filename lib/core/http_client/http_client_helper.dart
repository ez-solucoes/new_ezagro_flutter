import 'dart:convert';

import 'package:new_ezagro_flutter/core/errors/server_error.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/http_client/http_response.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';

ServerError mountServerErrorInstance({
  required HttpRequest request,
  required HttpResponse response,
  String? friendlyMessage,
}) {
  final causedBy = StringBuffer()
    ..write(AppStringsPortuguese.serverErrorCausedBy)
    ..write(request.method.name)
    ..write(' on ${request.path}')
    ..write(' with status code ${response.statusCode}');
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
    return AppStringsPortuguese.reautenticationNeededErrorMessage;
  }
  return serverErrorMessage;
}

// ResponseModel<T> mountModelInstanceFromResponse<T>({
//   required HttpResponse response,
//   required T Function(Map<String, dynamic>) fromMap,
//   required T Function(String) fromJson,
//   String? mountMapDataFromNodeName,
// }) {
//   final data = response.data;
//   if (data is Map) {
//     if (mountMapDataFromNodeName != null &&
//         data.containsKey(mountMapDataFromNodeName)) {
//       return ResponseModel.fromMap(data[mountMapDataFromNodeName], fromMap);
//     }
//     return ResponseModel.fromMap(data as Map<String, dynamic>, fromMap);
//   }
//   return ResponseModel.fromJson(data, fromJson);
// }

// T mountListModelInstanceFromResponse<T>({
//   required HttpResponse response,
//   required T Function(List) fromListMap,
//   required T Function(String) fromJsonList,
//   String? mountMapDataFromNodeName,
// }) {
//   final data = response.data['data'];
//   if (data is List ||
//       (mountMapDataFromNodeName != null &&
//           data is Map &&
//           data.containsKey(mountMapDataFromNodeName))) {
//     return fromListMap(
//       data is List ? data : ((data as Map)[mountMapDataFromNodeName] as List),
//     );
//   }
//   return fromJsonList(data);
// }

ResponseModel<T> mountResponseModelForSingleItem<T>({
  required HttpResponse response,
  required T Function(Map<String, dynamic>) fromMap,
}) {
  final Map<String, dynamic> responseMap;

  if(response.data is String) {
    responseMap = jsonDecode(response.data as String) as Map<String, dynamic>;
  } else if(response.data is Map<String, dynamic>) {
    responseMap = response.data as Map<String, dynamic>;
  } else {
    throw Exception("Tipo de dado inesperado na resposta HTTP: ${response.data.runtimeType}. Esperava String ou Map.");
  }

  return ResponseModel.fromMap(responseMap, (data) {
    return fromMap(data as Map<String, dynamic>);
  });
}

ResponseModel<List<T>> mountResponseModelForPaginatedList<T>({
  required HttpResponse response,
  required List<T> Function(List<dynamic>) fromListMap,
}) {
  final Map<String, dynamic> responseMap;

  if (response.data is String) {
    responseMap = jsonDecode(response.data as String) as Map<String, dynamic>;
  } else if (response.data is Map<String, dynamic>) {
    responseMap = response.data as Map<String, dynamic>;
  } else {
    throw Exception("Tipo de dado inesperado na resposta HTTP: ${response.data.runtimeType}. Esperava String ou Map.");
  }

  return ResponseModel.fromMap(responseMap, (data) {
    return fromListMap(data as List<dynamic>);
  });
}