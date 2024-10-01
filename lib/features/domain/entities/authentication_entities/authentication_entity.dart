import '../employee_entities/employee_entity.dart';

class AuthenticationEntity {
  final String? token;
  final String username;
  final ClientEntity? client;
  final EmployeeEntity? employee;
  final Outsource outsource;
  final AuthenticationEntityCompany company;
  final String? dtLastLogin;
  final bool isLocked;
  final String firstAccessVerification;
  final List<Token> group;

  AuthenticationEntity({
    required this.token,
    required this.client,
    required this.username,
    required this.employee,
    required this.outsource,
    required this.company,
    required this.dtLastLogin,
    required this.isLocked,
    required this.firstAccessVerification,
    required this.group,
  });

}

class ClientEntity {
  int id;
  Token name;
  Token cpf;
  Phone phone;
  ClientEmail email;

  ClientEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.phone,
    required this.email,
  });

}

enum Token {
  STRING
}

  class ClientEmail {
    int id;
    Token email;

    ClientEmail({
      required this.id,
      required this.email,
    });

  }

class Phone {
  int id;
  Token number;
  Token whatsapp;
  bool? active;

  Phone({
    required this.id,
    required this.number,
    required this.whatsapp,
    this.active,
  });

}

class AuthenticationEntityCompany {
  int id;
  Token name;
  Token cnpj;
  Token cpf;
  bool isServiceProvider;
  bool exempt;
  bool isAssigned;
  bool ownedByUser;
  Token stateRegistration;
  CompanyType companyType;
  Phone phone;
  ClientEmail email;
  Address address;
  OutsourceAccount account;
  List<AccountType> businessCategories;
  CompanyCostCenter costCenter;
  List<PurpleContract> contracts;
  List<Attachment> attachments;
  Token attachmentNames;
  List<CompanyType> shareholdingStructure;
  PaymentMethod paymentMethod;

  AuthenticationEntityCompany({
    required this.id,
    required this.name,
    required this.cnpj,
    required this.cpf,
    required this.isServiceProvider,
    required this.exempt,
    required this.isAssigned,
    required this.ownedByUser,
    required this.stateRegistration,
    required this.companyType,
    required this.phone,
    required this.email,
    required this.address,
    required this.account,
    required this.businessCategories,
    required this.costCenter,
    required this.contracts,
    required this.attachments,
    required this.attachmentNames,
    required this.shareholdingStructure,
    required this.paymentMethod,
  });

}

class OutsourceAccount {
  int id;
  Token agency;
  Token account;
  Token bank;
  List<Pix> pix;
  AccountType accountType;

  OutsourceAccount({
    required this.id,
    required this.agency,
    required this.account,
    required this.bank,
    required this.pix,
    required this.accountType,
  });

}

class AccountType {
  int id;
  Token description;

  AccountType({
    required this.id,
    required this.description,
  });

}

class Pix {
  int id;
  CompanyType pixType;
  Token pixKey;
  bool? active;

  Pix({
    required this.id,
    required this.pixType,
    required this.pixKey,
    this.active,
  });

}

class PestStage {
  int id;
  Token description;
  int time;
  Token unitOfDays;
  String infestationLevel;
  int minimumInfestationLevel;
  Token measurementQuantityOfLeaves;
  CompanyType developmentCycle;
  Token name;
  String quantityByAreaType;
  String pestUnitOfTime;

  PestStage({
    required this.id,
    required this.description,
    required this.time,
    required this.unitOfDays,
    required this.infestationLevel,
    required this.minimumInfestationLevel,
    required this.measurementQuantityOfLeaves,
    required this.developmentCycle,
    required this.name,
    required this.quantityByAreaType,
    required this.pestUnitOfTime,
  });

}

class Pest {
  int id;
  Token commonName1;
  Token commonName2;
  Token commonName3;
  Token scientificName;
  List<PestStage> pestStages;
  String quantityByAreaType;
  Token pestType;

  Pest({
    required this.id,
    required this.commonName1,
    required this.commonName2,
    required this.commonName3,
    required this.scientificName,
    required this.pestStages,
    required this.quantityByAreaType,
    required this.pestType,
  });

}

class CompanyType {
  int id;
  Token name;
  Token? description;
  bool? active;
  PercentageByDate? percentageByDate;
  List<Pest>? pests;
  String? pestType;
  Token? cpf;
  int? percentage;

  CompanyType({
    required this.id,
    required this.name,
    this.description,
    this.active,
    this.percentageByDate,
    this.pests,
    this.pestType,
    this.cpf,
    this.percentage,
  });

}

class PercentageByDate {
  DateTime additionalProp1;
  DateTime additionalProp2;
  DateTime additionalProp3;

  PercentageByDate({
    required this.additionalProp1,
    required this.additionalProp2,
    required this.additionalProp3,
  });

}

class Address {
  int id;
  Token country;
  Token referenceLocation;
  Token state;
  Token cep;
  Token city;
  Token neighbourhood;
  Token street;
  Token number;
  Token complement;
  bool? active;

  Address({
    required this.id,
    required this.country,
    required this.referenceLocation,
    required this.state,
    required this.cep,
    required this.city,
    required this.neighbourhood,
    required this.street,
    required this.number,
    required this.complement,
    this.active,
  });

}

class Attachment {
  Token name;
  Token originalFilename;
  Token contentType;
  int size;
  List<Token> content;

  Attachment({
    required this.name,
    required this.originalFilename,
    required this.contentType,
    required this.size,
    required this.content,
  });

}

class PurpleContract {
  int id;
  Token company;
  ContractedCompanyClass contractedCompany;
  RuralProducer ruralProducer;
  Farm farm;
  Token contract;
  DateTime dtContract;
  DateTime dtContractEnd;
  List<Attachment> attachments;
  Token description;
  List<CompanyCostCenter> costCenters;
  List<PurplePlot> plots;
  CompanyType contractType;
  Token attachmentNames;
  Token externalCode;
  List<ContractCoverage> contractCoverages;
  int deductiblePrice;
  int fixedPrice;
  List<Item> items;

  PurpleContract({
    required this.id,
    required this.company,
    required this.contractedCompany,
    required this.ruralProducer,
    required this.farm,
    required this.contract,
    required this.dtContract,
    required this.dtContractEnd,
    required this.attachments,
    required this.description,
    required this.costCenters,
    required this.plots,
    required this.contractType,
    required this.attachmentNames,
    required this.externalCode,
    required this.contractCoverages,
    required this.deductiblePrice,
    required this.fixedPrice,
    required this.items,
  });

}

class ContractCoverage {
  int id;
  Token description;
  int coverageValue;
  Token contract;

  ContractCoverage({
    required this.id,
    required this.description,
    required this.coverageValue,
    required this.contract,
  });

}

class ContractedCompanyClass {
  int id;
  Address address;
  AccountElement account;
  Phone phone;
  CompanyType companyType;
  bool exempt;
  Token stateRegistration;
  ContractedCompanyEmail email;
  Token name;
  Token cnpj;
  Token cpf;
  bool isServiceProvider;
  List<CompanyType> businessCategories;
  bool ownedByUser;
  List<ContractedCompanyContract> contracts;
  List<Token> attachmentNames;
  List<Token> attachments;
  List<ShareholdingStructure> shareholdingStructure;
  PaymentMethod paymentMethod;
  bool active;

  ContractedCompanyClass({
    required this.id,
    required this.address,
    required this.account,
    required this.phone,
    required this.companyType,
    required this.exempt,
    required this.stateRegistration,
    required this.email,
    required this.name,
    required this.cnpj,
    required this.cpf,
    required this.isServiceProvider,
    required this.businessCategories,
    required this.ownedByUser,
    required this.contracts,
    required this.attachmentNames,
    required this.attachments,
    required this.shareholdingStructure,
    required this.paymentMethod,
    required this.active,
  });

}

class AccountElement {
  int id;
  Token agency;
  Token account;
  Token bank;
  CompanyType accountType;
  List<Pix> pix;
  bool active;

  AccountElement({
    required this.id,
    required this.agency,
    required this.account,
    required this.bank,
    required this.accountType,
    required this.pix,
    required this.active,
  });

}

class ContractedCompanyContract {
  int id;
  Token company;
  Token contractedCompany;
  Token ruralProducer;
  Token farm;
  Token contract;
  DateTime dtContract;
  DateTime dtContractEnd;
  Token description;
  List<Token> attachmentNames;
  List<Token> attachments;
  List<LastPlotCostCenter> costCenters;
  List<LastPlotElement> plots;
  int fixedPrice;
  int deductiblePrice;
  List<Item> items;
  List<ContractCoverage> contractCoverages;
  CompanyType contractType;
  Token externalCode;
  bool active;

  ContractedCompanyContract({
    required this.id,
    required this.company,
    required this.contractedCompany,
    required this.ruralProducer,
    required this.farm,
    required this.contract,
    required this.dtContract,
    required this.dtContractEnd,
    required this.description,
    required this.attachmentNames,
    required this.attachments,
    required this.costCenters,
    required this.plots,
    required this.fixedPrice,
    required this.deductiblePrice,
    required this.items,
    required this.contractCoverages,
    required this.contractType,
    required this.externalCode,
    required this.active,
  });

}

class LastPlotCostCenter {
  int id;
  Token name;
  CompanyType costCenterType;
  DateTime dtStart;
  DateTime dtEnd;
  bool active;

  LastPlotCostCenter({
    required this.id,
    required this.name,
    required this.costCenterType,
    required this.dtStart,
    required this.dtEnd,
    required this.active,
  });

}

class Item {
  int id;
  Token name;
  int unitPrice;
  DateTime dtPayment;
  CompanyType paymentMethod;
  CompanyType paymentPeriodicity;
  Token contract;

  Item({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.dtPayment,
    required this.paymentMethod,
    required this.paymentPeriodicity,
    required this.contract,
  });

}

class LastPlotElement {
  int id;
  CompanyType plotGroup;
  CompanyType plotOwnerShipType;
  Coordinate coordinate;
  int number;
  List<LastPlotSoilStages> plotSoilStages;
  bool isLease;
  List<LastPlotCropDiversity> plotCropDiversities;
  int area;
  List<LastPlotCostCenter> costCenters;
  DateTime dtLastPlanting;
  int atr;
  int tch;
  List<LastPlotCropDiversity> plotCropDiversityHistory;
  LastPlotSoilStages lastPlotSoilStages;
  LastPlotCropDiversity lastPlotCropDiversity;
  bool active;

  LastPlotElement({
    required this.id,
    required this.plotGroup,
    required this.plotOwnerShipType,
    required this.coordinate,
    required this.number,
    required this.plotSoilStages,
    required this.isLease,
    required this.plotCropDiversities,
    required this.area,
    required this.costCenters,
    required this.dtLastPlanting,
    required this.atr,
    required this.tch,
    required this.plotCropDiversityHistory,
    required this.lastPlotSoilStages,
    required this.lastPlotCropDiversity,
    required this.active,
  });

}

class Coordinate {
  int id;
  int latitude;
  int longitude;
  bool? active;

  Coordinate({
    required this.id,
    required this.latitude,
    required this.longitude,
    this.active,
  });

}

class LastPlotCropDiversity {
  Id id;
  DateTime dtStart;
  LastPlotCropDiversityCropDiversity cropDiversity;
  Token plot;

  LastPlotCropDiversity({
    required this.id,
    required this.dtStart,
    required this.cropDiversity,
    required this.plot,
  });

}

class LastPlotCropDiversityCropDiversity {
  int id;
  Token name;
  CompanyType crop;
  CompanyType technologyType;
  PlantingType plantingType;
  PlantingCycle plantingCycle;
  int plantingCycleDays;
  Token unconventionalTechnology;
  bool active;

  LastPlotCropDiversityCropDiversity({
    required this.id,
    required this.name,
    required this.crop,
    required this.technologyType,
    required this.plantingType,
    required this.plantingCycle,
    required this.plantingCycleDays,
    required this.unconventionalTechnology,
    required this.active,
  });

}

enum PlantingCycle {
  SUPERPRECOCE
}

enum PlantingType {
  PERENE
}

class Id {
  int cropDiversityId;
  int plotId;

  Id({
    required this.cropDiversityId,
    required this.plotId,
  });

}

class LastPlotSoilStages {
  int id;
  DateTime dtStart;
  CompanyType soilStage;
  Token nextSoilStage;
  bool active;

  LastPlotSoilStages({
    required this.id,
    required this.dtStart,
    required this.soilStage,
    required this.nextSoilStage,
    required this.active,
  });

}

class ContractedCompanyEmail {
  int id;
  Token email;
  bool active;

  ContractedCompanyEmail({
    required this.id,
    required this.email,
    required this.active,
  });

}

enum PaymentMethod {
  DINHEIRO
}

class ShareholdingStructure {
  int id;
  Token name;
  Token cpf;
  int percentage;
  bool active;

  ShareholdingStructure({
    required this.id,
    required this.name,
    required this.cpf,
    required this.percentage,
    required this.active,
  });

}

class CompanyCostCenter {
  int id;
  Token name;
  CompanyType costCenterType;
  DateTime dtStart;
  DateTime dtEnd;

  CompanyCostCenter({
    required this.id,
    required this.name,
    required this.costCenterType,
    required this.dtStart,
    required this.dtEnd,
  });

}

class Farm {
  int id;
  Address address;
  Token nameLandowner;
  Token recordLandowner;
  List<LastPlotCostCenter> costCenters;
  Token car;
  Token stateRegistration;
  Token externalCode;
  List<LastPlotElement> plots;
  ContractedCompanyClass company;
  Token name;
  int areaAcre;
  List<ContractedCompanyContract> contracts;
  Token caepf;
  Token cnae;
  List<Token> attachmentNames;
  List<Token> attachments;
  LastPlotElement lastPlot;
  bool active;

  Farm({
    required this.id,
    required this.address,
    required this.nameLandowner,
    required this.recordLandowner,
    required this.costCenters,
    required this.car,
    required this.stateRegistration,
    required this.externalCode,
    required this.plots,
    required this.company,
    required this.name,
    required this.areaAcre,
    required this.contracts,
    required this.caepf,
    required this.cnae,
    required this.attachmentNames,
    required this.attachments,
    required this.lastPlot,
    required this.active,
  });

}

class PurplePlot {
  int id;
  Status plotGroup;
  Coordinate coordinate;
  Status plotOwnerShipType;
  int number;
  PlotCropDiversity plotCropDiversity;
  bool isLease;
  int area;
  List<CompanyCostCenter> costCenters;
  DateTime dtLastPlanting;
  int atr;
  int tch;
  List<PlotSoilStage> plotSoilStages;

  PurplePlot({
    required this.id,
    required this.plotGroup,
    required this.coordinate,
    required this.plotOwnerShipType,
    required this.number,
    required this.plotCropDiversity,
    required this.isLease,
    required this.area,
    required this.costCenters,
    required this.dtLastPlanting,
    required this.atr,
    required this.tch,
    required this.plotSoilStages,
  });

}

class PlotCropDiversity {
  Id id;
  DateTime dtStart;
  PurpleCropDiversity cropDiversity;

  PlotCropDiversity({
    required this.id,
    required this.dtStart,
    required this.cropDiversity,
  });

}

class PurpleCropDiversity {
  int id;
  Token name;
  CompanyType technologyType;
  PlantingType plantingType;
  PlantingCycle plantingCycle;
  CompanyType crop;
  int plantingCycleDays;
  Token unconventionalTechnology;

  PurpleCropDiversity({
    required this.id,
    required this.name,
    required this.technologyType,
    required this.plantingType,
    required this.plantingCycle,
    required this.crop,
    required this.plantingCycleDays,
    required this.unconventionalTechnology,
  });

}

class Status {
  int id;
  Token name;

  Status({
    required this.id,
    required this.name,
  });

}

class PlotSoilStage {
  int id;
  LastPlotElement plot;
  DateTime dtStart;
  CompanyType soilStage;

  PlotSoilStage({
    required this.id,
    required this.plot,
    required this.dtStart,
    required this.soilStage,
  });

}

class RuralProducer {
  int id;
  DateTime dtBirth;
  Token stateRegistration;
  Token name;
  Token cpf;
  List<AccountElement> accounts;
  List<ContractedCompanyContract> contracts;
  List<Token> attachmentNames;
  List<Token> attachments;
  List<CompanyType> commonAssociation;
  List<Farm> farms;
  bool active;

  RuralProducer({
    required this.id,
    required this.dtBirth,
    required this.stateRegistration,
    required this.name,
    required this.cpf,
    required this.accounts,
    required this.contracts,
    required this.attachmentNames,
    required this.attachments,
    required this.commonAssociation,
    required this.farms,
    required this.active,
  });

}

class AuthenticationEntityEmployee {
  int id;
  Address address;
  AccountElement account;
  Token employeeName;
  Farm farm;
  ContractedCompanyClass company;
  RuralProducer ruralProducer;
  ContractedCompanyEmail email;
  LastPlotCostCenter costCenter;
  List<Dependent> dependents;
  Token cpf;
  Token pisPasep;
  Token insuranceCode;
  Token ceiNumber;
  Token motherName;
  Token rg;
  CompanyType status;
  DateTime dtBirth;
  FluffyContract contract;
  PurpleContract healthPlanContract;
  Token securityCode;
  Token sindicalCode;
  List<MeasureAndPerformance> measureAndPerformances;
  Token description;
  List<Attachment> attachments;
  Token attachmentNames;
  Token phoneNumber;
  Token whatsappNumber;

  AuthenticationEntityEmployee({
    required this.id,
    required this.address,
    required this.account,
    required this.employeeName,
    required this.farm,
    required this.company,
    required this.ruralProducer,
    required this.email,
    required this.costCenter,
    required this.dependents,
    required this.cpf,
    required this.pisPasep,
    required this.insuranceCode,
    required this.ceiNumber,
    required this.motherName,
    required this.rg,
    required this.status,
    required this.dtBirth,
    required this.contract,
    required this.healthPlanContract,
    required this.securityCode,
    required this.sindicalCode,
    required this.measureAndPerformances,
    required this.description,
    required this.attachments,
    required this.attachmentNames,
    required this.phoneNumber,
    required this.whatsappNumber,
  });

}

class FluffyContract {
  int id;
  CompanyType type;
  int number;
  Token file;
  DateTime dtAdmission;
  DateTime dtDismissal;
  Token function;
  Department department;
  CompanyType shift;
  int baseSalary;
  int combinedSalary;
  int variedSalary;
  int alimonyPercentage;
  int alimonyPercentageWithdrawFgts;
  Token valueTicket;
  int additionalUnhealthy;
  int additionalDanger;
  bool trustPosition;
  Token dismissalReason;
  List<PurpleEmployeeCompositionSalary> employeeCompositionSalary;

  FluffyContract({
    required this.id,
    required this.type,
    required this.number,
    required this.file,
    required this.dtAdmission,
    required this.dtDismissal,
    required this.function,
    required this.department,
    required this.shift,
    required this.baseSalary,
    required this.combinedSalary,
    required this.variedSalary,
    required this.alimonyPercentage,
    required this.alimonyPercentageWithdrawFgts,
    required this.valueTicket,
    required this.additionalUnhealthy,
    required this.additionalDanger,
    required this.trustPosition,
    required this.dismissalReason,
    required this.employeeCompositionSalary,
  });

}

class Department {
  int id;
  Token name;
  Token description;
  Token departmentParent;
  List<Token> subDepartments;
  bool active;

  Department({
    required this.id,
    required this.name,
    required this.description,
    required this.departmentParent,
    required this.subDepartments,
    required this.active,
  });

}

class PurpleEmployeeCompositionSalary {
  int id;
  Token salaryComposition;
  int salaryCompositionReference;
  String salaryReferenceBase;

  PurpleEmployeeCompositionSalary({
    required this.id,
    required this.salaryComposition,
    required this.salaryCompositionReference,
    required this.salaryReferenceBase,
  });

}

class DependentEmployee {
  int id;
  Address address;
  AccountElement account;
  Token employeeName;
  Token phoneNumber;
  Token whatsappNumber;
  Farm farm;
  ContractedCompanyClass company;
  RuralProducer ruralProducer;
  ContractedCompanyEmail email;
  LastPlotCostCenter costCenter;
  List<Dependent> dependents;
  Token cpf;
  Token pisPasep;
  Token insuranceCode;
  Token ceiNumber;
  Token motherName;
  Token rg;
  CompanyType status;
  DateTime dtBirth;
  TentacledContract contract;
  ContractedCompanyContract healthPlanContract;
  Token securityCode;
  Token sindicalCode;
  List<MeasureAndPerformance> measureAndPerformances;
  Token description;
  List<Token> attachmentNames;
  List<Token> attachments;
  bool active;

  DependentEmployee({
    required this.id,
    required this.address,
    required this.account,
    required this.employeeName,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.farm,
    required this.company,
    required this.ruralProducer,
    required this.email,
    required this.costCenter,
    required this.dependents,
    required this.cpf,
    required this.pisPasep,
    required this.insuranceCode,
    required this.ceiNumber,
    required this.motherName,
    required this.rg,
    required this.status,
    required this.dtBirth,
    required this.contract,
    required this.healthPlanContract,
    required this.securityCode,
    required this.sindicalCode,
    required this.measureAndPerformances,
    required this.description,
    required this.attachmentNames,
    required this.attachments,
    required this.active,
  });

}

class Dependent {
  int id;
  DependentEmployee? employee;
  Token name;
  Token relationship;
  DateTime dateOfBirth;
  bool? active;

  Dependent({
    required this.id,
    this.employee,
    required this.name,
    required this.relationship,
    required this.dateOfBirth,
    this.active,
  });

}

class TentacledContract {
  int id;
  CompanyType type;
  int number;
  Token file;
  DateTime dtAdmission;
  DateTime dtDismissal;
  Token function;
  Department department;
  CompanyType shift;
  int baseSalary;
  int combinedSalary;
  int variedSalary;
  int alimonyPercentage;
  int alimonyPercentageWithdrawFgts;
  Token valueTicket;
  int additionalUnhealthy;
  int additionalDanger;
  bool trustPosition;
  Token dismissalReason;
  List<FluffyEmployeeCompositionSalary> employeeCompositionSalary;
  bool active;

  TentacledContract({
    required this.id,
    required this.type,
    required this.number,
    required this.file,
    required this.dtAdmission,
    required this.dtDismissal,
    required this.function,
    required this.department,
    required this.shift,
    required this.baseSalary,
    required this.combinedSalary,
    required this.variedSalary,
    required this.alimonyPercentage,
    required this.alimonyPercentageWithdrawFgts,
    required this.valueTicket,
    required this.additionalUnhealthy,
    required this.additionalDanger,
    required this.trustPosition,
    required this.dismissalReason,
    required this.employeeCompositionSalary,
    required this.active,
  });

}

class FluffyEmployeeCompositionSalary {
  int id;
  Token employeeContract;
  Token salaryComposition;
  int salaryCompositionReference;
  String salaryReferenceBase;
  bool active;

  FluffyEmployeeCompositionSalary({
    required this.id,
    required this.employeeContract,
    required this.salaryComposition,
    required this.salaryCompositionReference,
    required this.salaryReferenceBase,
    required this.active,
  });

}

class MeasureAndPerformance {
  int id;
  Token setGoals;
  DateTime dtGoalEvaluationStart;
  DateTime dtGoalEvaluationEnd;
  Token goalPerformance;
  int bonusesReceived;
  bool? active;

  MeasureAndPerformance({
    required this.id,
    required this.setGoals,
    required this.dtGoalEvaluationStart,
    required this.dtGoalEvaluationEnd,
    required this.goalPerformance,
    required this.bonusesReceived,
    this.active,
  });

}

class Outsource {
  int id;
  Address address;
  OutsourceAccount account;
  Phone phone;
  ClientEmail email;
  Status type;
  Status status;
  bool lessee;
  Token cnpj;
  Token cpf;
  Token name;
  Token contract;

  Outsource({
    required this.id,
    required this.address,
    required this.account,
    required this.phone,
    required this.email,
    required this.type,
    required this.status,
    required this.lessee,
    required this.cnpj,
    required this.cpf,
    required this.name,
    required this.contract,
  });

}
