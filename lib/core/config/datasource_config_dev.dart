import 'package:new_ezagro_flutter/core/config/datasource_config.dart';

import '../../features/data/datasources/remote_datasource/api_endpoints.dart';

class DatasourceConfigDev implements DatasourceConfig {
  @override
  String get apiAuthority => AppEndpoints.mainBaseUrl;

  @override
  String get apiScheme => AppEndpoints.baseUrlProtocolWithSecurity;

  @override
  bool get isSendFeedbackEnabled => false;
}
