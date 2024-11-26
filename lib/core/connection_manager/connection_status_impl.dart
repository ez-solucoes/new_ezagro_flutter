import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/core/connection_manager/connection_status.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/api_endpoints.dart';

class ConnectionStatusImpl with UriBuilder implements ConnectionStatus {
  ConnectionStatusImpl({required this.httpClient});

  final HttpClient httpClient;

  StreamController connectionChangeController = StreamController.broadcast();

  final Connectivity _connectivity = Connectivity();

  bool hasConnection = false;

  @override
  void initialize() async {
    _connectivity.onConnectivityChanged.listen(connectionChangeListener);
    await checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  @override
  void dispose() {
    connectionChangeController.close();
  }

  @override
  void connectionChangeListener(List<ConnectivityResult> result) async {
    debugPrint('_connectivity connection changed: $result');
    if (result[0] != ConnectivityResult.none) {
      await checkConnection();
    } else {
      debugPrint('Sem conexão com a internet');
      hasConnection = false;
    }
  }

  @override
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.swaggerEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);

    try {
      final result = await httpClient.execute(request).timeout(const Duration(seconds: 3));

      if (result.statusCode == 200) {
        hasConnection = true;

        //Bloco para verificar se existe dados a serem enviados do banco de dados local
      } else {
        //Tem conexão mas retornou erro ao chamar API
        hasConnection = false;
      }
    } on TimeoutException catch (_) {
      hasConnection = false;
    } on SocketException catch (_) {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }
}
