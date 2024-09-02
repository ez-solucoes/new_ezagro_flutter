import 'package:new_ezagro_flutter/core/config/datasource_config.dart';
import 'package:new_ezagro_flutter/features/data/datasources/api_datasource/api_endpoints/api_endpoints.dart';

class DatasourceConfigDev implements DatasourceConfig {
  @override
  String get apiAuthority => AppEndpoints.mainBaseUrl;

  @override
  String get apiScheme => AppEndpoints.baseUrlProtocolWithSecurity;

  @override
  bool get isSendFeedbackEnabled => false;
}
