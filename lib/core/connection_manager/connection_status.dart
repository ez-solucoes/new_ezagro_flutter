import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectionStatus {
  void initialize();

  void dispose();

  void connectionChangeListener(List<ConnectivityResult> result);

  Future checkConnection();
}