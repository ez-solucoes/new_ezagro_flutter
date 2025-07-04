import '../../../../core/config/environment_config.dart';

class AppEndpoints {
  // Dynamic URL based on environment
  static String get mainBaseUrl => EnvironmentConfig.apiUrl;
  
  // Legacy constants for reference
  static const mainBaseUrlProd = 'api.ezagro.com.br';
  static const mainBaseUrlDev = 'api.dev.temp.ezagro.com.br';

  static String get baseUrlProtocolWithSecurity => EnvironmentConfig.scheme;
  static const String baseUrlProtocol = 'http';

  //Swagger documentation
  static const String swaggerEndpoint = '/api';

  static const String selectEndpoint = '/select';

  //Authentication
  static const String authenticationLoginEndpoint = '/authentication/login';
  static const String authenticationUpdatePasswordEndpoint = '/update-password';
  static const String authenticationForgotPasswordEndpoint = '/authentication/forgot-password';
  static const String validateTokenEndpoint = '/validate-token';

  //User
  static const String userEndpoint = '/user';
  static const String userByIdEndpoint = '/user/';

  //Agricultural Input
  static const String agriculturalInputEndpoint = '/agricultural-input';
  static const String agriculturalInputClassEndpoint = '/agricultural-input-class';

  //Company
  static const String companyEndpoint = '/company';
  static const String companySegmentEndpoint = '/company-segment';

  //Contract
  static const String contractEndpoint = '/contract';

  //Agricultural Activities
  static const String agriculturalActivityEndpoint = '/agricultural-activity';
  static const String agriculturalActivityTypeEndpoint = '/agricultural-activity-type';
  static const String agriculturalSubActivityEndpoint = '/agricultural-sub-activity';

  //Service Order
  static const String getFieldServiceOrderListEndpoint = '/field-service-order';
  static const String serviceOrderEndpoint = '/service-order';
  static const String getServiceOrderEndpoint = '/service-order';
  static const String getServiceOrderById = 'field-service-order';
  static const String getActivityTypesEndpoint = '/activity-type';
  static const String costCentersEndpoint = '/cost-center';
  static const String farmEndpoint = '/farm';
  static const String farmPlotEndpoint = '/farm-plot';
  static const String getFarmById = '/farm/';
  static const String getFarmsSimplifiedEndpoint = '/farm/simplified';
  static const String getCostCenterFarmsEndpoint = '/farm/cost-center/';
  static const String cropEndpoint = '/crop';
  static const String cropVarietyEndpoint = '/crop-variety';
  static const String getPlotsEndpoint = '/farm/plot';
  static const String getExecutorsEndpoint = '/employee';
  static const String productEndpoint = '/product';
  static const String productTypeEndpoint = '/product-type';
  static const String getMachineryEndpoint = '/fleet/machinery';
  static const String employeeEndpoint = '/employee';
  static const String getEmployeeById = '/employee/';
  static const String postServiceOrderEndpoint = '/field-service-order';
  static const String pestEndpoint = '/pest';
  static const String getPlotsByFarmIdEndpoint = '/farm/plot/farm/';
  static const String getCostCenterSelectorOptions = '/cost-center/select';

  static const String machineryImplementEndpoint = '/machinery-implement';
  static const String paymentMethodEndpoint = '/payment-method';

  ///Purchase Request
  static const String purchaseRequest = '/purchase-request';
  static const String purchaseRequestTypeEndpoint = '/purchase-request-type';
  static const String purchaseRequestDeliveryLocationEndpoint = '/purchase-request-delivery-location';

  ///Approvals
  static const String approvePurchaseRequest = '/approve';

}
