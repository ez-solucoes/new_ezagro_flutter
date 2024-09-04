class AppEndpoints {
  static const mainBaseUrl = 'api-dev.ezagro.com.br';
  static const String baseUrlProtocolWithSecurity = 'https';
  static const String baseUrlProtocol = 'http';

  //Authentication
  static const String authenticateEndpoint = '/authenticate';
  static const String firstAccessEndpoint = '/update-password';
  static const String forgotPasswordEndpoint = '/recover-password';
  static const String registerEndpoint = '/register';
  static const String validateTokenEndpoint = '/validate-token';

  //Service Order
  static const String getServiceOrderListEndpoint = '/field/service-order/simplified';
}