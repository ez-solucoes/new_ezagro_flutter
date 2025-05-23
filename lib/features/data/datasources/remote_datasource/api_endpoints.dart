class AppEndpoints {
  static const mainBaseUrlDev = 'api.dev.temp.ezagro.com.br';
  static const String baseUrlProtocolWithSecurity = 'https';
  static const String baseUrlProtocol = 'http';

  //Swagger documentation
  static const String swaggerEndpoint = '/api';

  static const String selectEndpoint = '/select';

  //Authentication
  static const String loginEndpoint = '/authentication/login';
  static const String updatePasswordEndpoint = '/update-password';
  static const String forgotPasswordEndpoint = '/authentication/forgot-password';
  static const String validateTokenEndpoint = '/validate-token';

  //User
  static const String userEndpoint = '/user';
  static const String userByIdEndpoint = '/user/';

  //Company
  static const String companyEndpoint = '/company';
  static const String companySegmentEndpoint = '/company-segment';

  //Contract
  static const String getContractListEndpoint = '/contract';
  static const String getContractByIdEndpoint = '/contract/';

  //Service Order
  static const String getFieldServiceOrderListEndpoint = '/field-service-order';
  static const String getServiceOrderListEndpoint = '/service-order';
  static const String getServiceOrderEndpoint = '/service-order';
  static const String getServiceOrderById = 'field-service-order';
  static const String getActivityTypesEndpoint = '/activity-type';
  static const String costCentersEndpoint = '/cost-center';
  static const String farmEndpoint = '/farm';
  static const String getFarmById = '/farm/';
  static const String getFarmsSimplifiedEndpoint = '/farm/simplified';
  static const String getCostCenterFarmsEndpoint = '/farm/cost-center/';
  static const String getSimplifiedCropsEndpoint = '/crop/simplified';
  static const String getPlotsEndpoint = '/farm/plot';
  static const String getExecutorsEndpoint = '/employee';
  static const String productEndpoint = '/product';
  static const String productTypeEndpoint = '/product-type';
  static const String getMachineryEndpoint = '/fleet/machinery';
  static const String employeeEndpoint = '/employee';
  static const String getEmployeeById = '/employee/';
  static const String postServiceOrderEndpoint = '/field-service-order';
  static const String getPestsEndpoint = '/pest';
  static const String getPlotsByFarmIdEndpoint = '/farm/plot/farm/';
  static const String getCostCenterSelectorOptions = '/cost-center/select';

  static const String getAllMachineryImplementEndpoint = '/machinery-implement';
  static const String paymentMethodEndpoint = '/payment-method';

  ///Purchase Request
  static const String getPurchaseRequest = '/purchase-request';
  static const String purchaseRequestTypeEndpoint = '/purchase-request-type';

  ///Approvals
  static const String approvePurchaseRequest = '/approve';

}
