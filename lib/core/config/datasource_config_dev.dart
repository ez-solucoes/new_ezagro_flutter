import 'package:new_ezagro_flutter/core/config/datasource_config.dart';

import '../../modules/data/datasources/api_endpoints.dart';

class DatasourceConfigDev implements DatasourceConfig {
  @override
  String get apiAuthority => AppEndpoints.mainBaseUrl;

  @override
  String get apiScheme => AppEndpoints.baseUrlProtocolWithSecurity;

  @override
  bool get isSendFeedbackEnabled => false;
}
