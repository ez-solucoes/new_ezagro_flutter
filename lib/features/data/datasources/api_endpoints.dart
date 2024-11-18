class AppEndpoints {
  static const mainBaseUrlDev = 'api.dev.temp.ezagro.com.br';
  static const String baseUrlProtocolWithSecurity = 'https';
  static const String baseUrlProtocol = 'http';

  //Authentication
  static const String loginEndpoint = '/authentication/login';
  static const String updatePasswordEndpoint = '/update-password';
  static const String forgotPasswordEndpoint = '/authentication/forgot-password';
  static const String validateTokenEndpoint = '/validate-token';

  //Service Order
  static const String getServiceOrderListEndpoint = '/field-service-order';
  static const String getServiceOrderById = 'field-service-order/';
  static const String getActivityTypesEndpoint = '/activity-type';
  static const String getCostCentersEndpoint = '/cost-center';
  static const String getFarmsSimplifiedEndpoint = '/farm/simplified';
  static const String getSimplifiedCropsEndpoint = '/crop/simplified';
  static const String getPlotsEndpoint = '/farm/plot';
  static const String getExecutorsEndpoint = '/employee';
  static const String getProductsEndpoint = '/product';
  static const String getMachineryEndpoint = '/fleet/machinery';
  static const String getEmployees = '/employee';
  static const String postServiceOrderEndpoint = '/field-service-order';
  static const String getPestsEndpoint = '/pest';
}
