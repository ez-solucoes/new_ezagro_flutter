class AppEndpoints {
  static const mainBaseUrlDev = 'api.dev.temp.ezagro.com.br';
  static const String baseUrlProtocolWithSecurity = 'https';
  static const String baseUrlProtocol = 'http';

  //Swagger documentation
  static const String swaggerEndpoint = '/api';

  //Authentication
  static const String loginEndpoint = '/authentication/login';
  static const String updatePasswordEndpoint = '/update-password';
  static const String forgotPasswordEndpoint = '/authentication/forgot-password';
  static const String validateTokenEndpoint = '/validate-token';

  //User
  static const String userEndpoint = '/user';
  static const String userByIdEndpoint = '/user/';

  //Company
  static const String getCompanyListEndpoint = '/company';
  static const String getCompanyById = '/company/:';

  //Service Order
  static const String getServiceOrderListEndpoint = '/field-service-order';
  static const String getServiceOrderById = 'field-service-order/';
  static const String getActivityTypesEndpoint = '/activity-type';
  static const String getCostCentersEndpoint = '/cost-center';
  static const String getFarmsSimplifiedEndpoint = '/farm/simplified';
  static const String getCostCenterFarmsEndpoint = '/farm/cost-center/';
  static const String getSimplifiedCropsEndpoint = '/crop/simplified';
  static const String getPlotsEndpoint = '/farm/plot';
  static const String getExecutorsEndpoint = '/employee';
  static const String getProductsEndpoint = '/product';
  static const String getMachineryEndpoint = '/fleet/machinery';
  static const String getEmployees = '/employee';
  static const String postServiceOrderEndpoint = '/field-service-order';
  static const String getPestsEndpoint = '/pest';
  static const String getPlotsByFarmIdEndpoint = '/farm/plot/farm/';
  static const String getCostCenterSelectorOptions = '/cost-center/select';
}
