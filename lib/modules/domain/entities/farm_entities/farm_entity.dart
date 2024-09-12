import 'package:equatable/equatable.dart';

import '../address_entities/address_entity.dart';

class FarmEntity extends Equatable{
  final int id;
  final AddressEntity? address;
  final String car;
  final String stateRegistration;
  final String externalCode;
  final String caepf;
  final String cnae;
  final String nameLandowner;
  final String recordLandowner;
  final CompanyEntity company;

}

class Content {
  final int? id;
  final Address? address;
  final List<CompanyCostCenter>? costCenters;
  final AttachmentNames? car;
  final AttachmentNames? stateRegistration;
  final AttachmentNames? externalCode;
  final AttachmentNames? caepf;
  final AttachmentNames? cnae;
  final AttachmentNames? nameLandowner;
  final AttachmentNames? recordLandowner;
  final ContentCompany? company;
  final List<ContentPlot>? plots;
  final AttachmentNames? name;
  final int? areaAcre;
  final List<ContentContract>? contracts;
  final List<Attachment>? attachments;
  final AttachmentNames? attachmentNames;

  Content({
    this.id,
    this.address,
    this.costCenters,
    this.car,
    this.stateRegistration,
    this.externalCode,
    this.caepf,
    this.cnae,
    this.nameLandowner,
    this.recordLandowner,
    this.company,
    this.plots,
    this.name,
    this.areaAcre,
    this.contracts,
    this.attachments,
    this.attachmentNames,
  });

}

class Address {
  final int? id;
  final AttachmentNames? country;
  final AttachmentNames? referenceLocation;
  final AttachmentNames? state;
  final AttachmentNames? cep;
  final AttachmentNames? city;
  final AttachmentNames? neighbourhood;
  final AttachmentNames? street;
  final AttachmentNames? number;
  final AttachmentNames? complement;
  final bool? active;

  Address({
    this.id,
    this.country,
    this.referenceLocation,
    this.state,
    this.cep,
    this.city,
    this.neighbourhood,
    this.street,
    this.number,
    this.complement,
    this.active,
  });

}

enum AttachmentNames {
  STRING
}

class Attachment {
  final AttachmentNames? name;
  final AttachmentNames? originalFilename;
  final AttachmentNames? contentType;
  final int? size;
  final List<AttachmentNames>? content;

  Attachment({
    this.name,
    this.originalFilename,
    this.contentType,
    this.size,
    this.content,
  });

}

class ContentCompany {
  final int? id;
  final AttachmentNames? name;
  final AttachmentNames? cnpj;
  final AttachmentNames? cpf;
  final bool? isServiceProvider;
  final bool? exempt;
  final bool? isAssigned;
  final bool? ownedByUser;
  final AttachmentNames? stateRegistration;
  final CompanyType? companyType;
  final Phone? phone;
  final PurpleEmail? email;
  final Address? address;
  final PurpleAccount? account;
  final List<BusinessCategory>? businessCategories;
  final CompanyCostCenter? costCenter;
  final List<ContentContract>? contracts;
  final List<Attachment>? attachments;
  final AttachmentNames? attachmentNames;
  final List<ShareholdingStructure>? shareholdingStructure;
  final String? paymentMethod;

  ContentCompany({
    this.id,
    this.name,
    this.cnpj,
    this.cpf,
    this.isServiceProvider,
    this.exempt,
    this.isAssigned,
    this.ownedByUser,
    this.stateRegistration,
    this.companyType,
    this.phone,
    this.email,
    this.address,
    this.account,
    this.businessCategories,
    this.costCenter,
    this.contracts,
    this.attachments,
    this.attachmentNames,
    this.shareholdingStructure,
    this.paymentMethod,
  });

}

class PurpleAccount {
  final int? id;
  final AttachmentNames? agency;
  final AttachmentNames? account;
  final AttachmentNames? bank;
  final List<Pix>? pix;
  final BusinessCategory? accountType;

  PurpleAccount({
    this.id,
    this.agency,
    this.account,
    this.bank,
    this.pix,
    this.accountType,
  });

}

class BusinessCategory {
  final int? id;
  final AttachmentNames? description;

  BusinessCategory({
    this.id,
    this.description,
  });

}

class Pix {
  final int? id;
  final CompanyType? pixType;
  final AttachmentNames? pixKey;
  final bool? active;

  Pix({
    this.id,
    this.pixType,
    this.pixKey,
    this.active,
  });

}

class PestStage {
  final int? id;
  final AttachmentNames? description;
  final int? time;
  final AttachmentNames? unitOfDays;
  final String? infestationLevel;
  final int? minimumInfestationLevel;
  final AttachmentNames? measurementQuantityOfLeaves;
  final CompanyType? developmentCycle;
  final AttachmentNames? name;
  final String? quantityByAreaType;
  final String? pestUnitOfTime;

  PestStage({
    this.id,
    this.description,
    this.time,
    this.unitOfDays,
    this.infestationLevel,
    this.minimumInfestationLevel,
    this.measurementQuantityOfLeaves,
    this.developmentCycle,
    this.name,
    this.quantityByAreaType,
    this.pestUnitOfTime,
  });

}

class Pest {
  final int? id;
  final AttachmentNames? commonName1;
  final AttachmentNames? commonName2;
  final AttachmentNames? commonName3;
  final AttachmentNames? scientificName;
  final List<PestStage>? pestStages;
  final String? quantityByAreaType;
  final AttachmentNames? pestType;

  Pest({
    this.id,
    this.commonName1,
    this.commonName2,
    this.commonName3,
    this.scientificName,
    this.pestStages,
    this.quantityByAreaType,
    this.pestType,
  });

}

class CompanyType {
  final int? id;
  final AttachmentNames? name;
  final AttachmentNames? description;
  final bool? active;
  final PercentageByDate? percentageByDate;
  final List<Pest>? pests;
  final String? pestType;
  final AttachmentNames? cpf;
  final int? percentage;

  CompanyType({
    this.id,
    this.name,
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
  final DateTime? additionalProp1;
  final DateTime? additionalProp2;
  final DateTime? additionalProp3;

  PercentageByDate({
    this.additionalProp1,
    this.additionalProp2,
    this.additionalProp3,
  });

}

class ContentContract {
  final int? id;
  final AttachmentNames? company;
  final ContractedCompanyClass? contractedCompany;
  final RuralProducer? ruralProducer;
  final Farm? farm;
  final AttachmentNames? contract;
  final DateTime? dtContract;
  final DateTime? dtContractEnd;
  final List<Attachment>? attachments;
  final AttachmentNames? description;
  final List<CompanyCostCenter>? costCenters;
  final List<ContentPlot>? plots;
  final CompanyType? contractType;
  final AttachmentNames? attachmentNames;
  final AttachmentNames? externalCode;
  final List<ContractCoverage>? contractCoverages;
  final int? deductiblePrice;
  final int? fixedPrice;
  final List<Item>? items;

  ContentContract({
    this.id,
    this.company,
    this.contractedCompany,
    this.ruralProducer,
    this.farm,
    this.contract,
    this.dtContract,
    this.dtContractEnd,
    this.attachments,
    this.description,
    this.costCenters,
    this.plots,
    this.contractType,
    this.attachmentNames,
    this.externalCode,
    this.contractCoverages,
    this.deductiblePrice,
    this.fixedPrice,
    this.items,
  });

}

class ContractCoverage {
  final int? id;
  final AttachmentNames? description;
  final int? coverageValue;
  final ContractCoverageContract? contract;

  ContractCoverage({
    this.id,
    this.description,
    this.coverageValue,
    this.contract,
  });

}

class ContractCoverageContract {
  final int? id;
  final AttachmentNames? company;
  final AttachmentNames? contractedCompany;
  final AttachmentNames? ruralProducer;
  final AttachmentNames? farm;
  final AttachmentNames? contract;
  final DateTime? dtContract;
  final DateTime? dtContractEnd;
  final AttachmentNames? description;
  final List<AttachmentNames>? attachmentNames;
  final List<AttachmentNames>? attachments;
  final List<LastPlotCostCenter>? costCenters;
  final List<LastPlotElement>? plots;
  final int? fixedPrice;
  final int? deductiblePrice;
  final List<AttachmentNames>? items;
  final List<AttachmentNames>? contractCoverages;
  final CompanyType? contractType;
  final AttachmentNames? externalCode;
  final bool? active;

  ContractCoverageContract({
    this.id,
    this.company,
    this.contractedCompany,
    this.ruralProducer,
    this.farm,
    this.contract,
    this.dtContract,
    this.dtContractEnd,
    this.description,
    this.attachmentNames,
    this.attachments,
    this.costCenters,
    this.plots,
    this.fixedPrice,
    this.deductiblePrice,
    this.items,
    this.contractCoverages,
    this.contractType,
    this.externalCode,
    this.active,
  });

}

class LastPlotCostCenter {
  final int? id;
  final AttachmentNames? name;
  final CompanyType? costCenterType;
  final DateTime? dtStart;
  final DateTime? dtEnd;
  final bool? active;

  LastPlotCostCenter({
    this.id,
    this.name,
    this.costCenterType,
    this.dtStart,
    this.dtEnd,
    this.active,
  });

}

class LastPlotElement {
  final int? id;
  final CompanyType? plotGroup;
  final CompanyType? plotOwnerShipType;
  final Coordinate? coordinate;
  final int? number;
  final List<LastPlotSoilStages>? plotSoilStages;
  final bool? isLease;
  final List<LastPlotCropDiversity>? plotCropDiversities;
  final int? area;
  final List<LastPlotCostCenter>? costCenters;
  final DateTime? dtLastPlanting;
  final int? atr;
  final int? tch;
  final List<LastPlotCropDiversity>? plotCropDiversityHistory;
  final LastPlotCropDiversity? lastPlotCropDiversity;
  final LastPlotSoilStages? lastPlotSoilStages;
  final bool? active;

  LastPlotElement({
    this.id,
    this.plotGroup,
    this.plotOwnerShipType,
    this.coordinate,
    this.number,
    this.plotSoilStages,
    this.isLease,
    this.plotCropDiversities,
    this.area,
    this.costCenters,
    this.dtLastPlanting,
    this.atr,
    this.tch,
    this.plotCropDiversityHistory,
    this.lastPlotCropDiversity,
    this.lastPlotSoilStages,
    this.active,
  });

}

class Coordinate {
  final int? id;
  final int? latitude;
  final int? longitude;
  final bool? active;

  Coordinate({
    this.id,
    this.latitude,
    this.longitude,
    this.active,
  });

}

class LastPlotCropDiversity {
  final Id? id;
  final DateTime? dtStart;
  final LastPlotCropDiversityCropDiversity? cropDiversity;
  final AttachmentNames? plot;

  LastPlotCropDiversity({
    this.id,
    this.dtStart,
    this.cropDiversity,
    this.plot,
  });

}

class LastPlotCropDiversityCropDiversity {
  final int? id;
  final AttachmentNames? name;
  final CompanyType? crop;
  final CompanyType? technologyType;
  final PlantingType? plantingType;
  final PlantingCycle? plantingCycle;
  final int? plantingCycleDays;
  final AttachmentNames? unconventionalTechnology;
  final bool? active;

  LastPlotCropDiversityCropDiversity({
    this.id,
    this.name,
    this.crop,
    this.technologyType,
    this.plantingType,
    this.plantingCycle,
    this.plantingCycleDays,
    this.unconventionalTechnology,
    this.active,
  });

}

enum PlantingCycle {
  SUPERPRECOCE
}

enum PlantingType {
  PERENE
}

class Id {
  final int? cropDiversityId;
  final int? plotId;

  Id({
    this.cropDiversityId,
    this.plotId,
  });

}

class LastPlotSoilStages {
  final int? id;
  final DateTime? dtStart;
  final CompanyType? soilStage;
  final AttachmentNames? nextSoilStage;
  final bool? active;

  LastPlotSoilStages({
    this.id,
    this.dtStart,
    this.soilStage,
    this.nextSoilStage,
    this.active,
  });

}

class ContractedCompanyClass {
  final int? id;
  final Address? address;
  final AccountElement? account;
  final Phone? phone;
  final CompanyType? companyType;
  final bool? exempt;
  final AttachmentNames? stateRegistration;
  final ContractedCompanyEmail? email;
  final AttachmentNames? name;
  final AttachmentNames? cnpj;
  final AttachmentNames? cpf;
  final bool? isServiceProvider;
  final List<CompanyType>? businessCategories;
  final bool? ownedByUser;
  final List<ContractCoverageContract>? contracts;
  final List<AttachmentNames>? attachmentNames;
  final List<AttachmentNames>? attachments;
  final List<ShareholdingStructure>? shareholdingStructure;
  final String? paymentMethod;
  final bool? active;

  ContractedCompanyClass({
    this.id,
    this.address,
    this.account,
    this.phone,
    this.companyType,
    this.exempt,
    this.stateRegistration,
    this.email,
    this.name,
    this.cnpj,
    this.cpf,
    this.isServiceProvider,
    this.businessCategories,
    this.ownedByUser,
    this.contracts,
    this.attachmentNames,
    this.attachments,
    this.shareholdingStructure,
    this.paymentMethod,
    this.active,
  });

}

class AccountElement {
  final int? id;
  final AttachmentNames? agency;
  final AttachmentNames? account;
  final AttachmentNames? bank;
  final CompanyType? accountType;
  final List<Pix>? pix;
  final bool? active;

  AccountElement({
    this.id,
    this.agency,
    this.account,
    this.bank,
    this.accountType,
    this.pix,
    this.active,
  });

}

class ContractedCompanyEmail {
  final int? id;
  final AttachmentNames? email;
  final bool? active;

  ContractedCompanyEmail({
    this.id,
    this.email,
    this.active,
  });

}

class Phone {
  final int? id;
  final AttachmentNames? number;
  final AttachmentNames? whatsapp;
  final bool? active;

  Phone({
    this.id,
    this.number,
    this.whatsapp,
    this.active,
  });

}

class ShareholdingStructure {
  final int? id;
  final AttachmentNames? name;
  final AttachmentNames? cpf;
  final int? percentage;
  final bool? active;

  ShareholdingStructure({
    this.id,
    this.name,
    this.cpf,
    this.percentage,
    this.active,
  });

}

class CompanyCostCenter {
  final int? id;
  final AttachmentNames? name;
  final CompanyType? costCenterType;
  final DateTime? dtStart;
  final DateTime? dtEnd;

  CompanyCostCenter({
    this.id,
    this.name,
    this.costCenterType,
    this.dtStart,
    this.dtEnd,
  });

}

class Farm {
  final int? id;
  final Address? address;
  final AttachmentNames? nameLandowner;
  final AttachmentNames? recordLandowner;
  final List<LastPlotCostCenter>? costCenters;
  final AttachmentNames? car;
  final AttachmentNames? stateRegistration;
  final AttachmentNames? externalCode;
  final List<LastPlotElement>? plots;
  final ContractedCompanyClass? company;
  final AttachmentNames? name;
  final int? areaAcre;
  final List<ContractCoverageContract>? contracts;
  final AttachmentNames? caepf;
  final AttachmentNames? cnae;
  final List<AttachmentNames>? attachmentNames;
  final List<AttachmentNames>? attachments;
  final LastPlotElement? lastPlot;
  final bool? active;

  Farm({
    this.id,
    this.address,
    this.nameLandowner,
    this.recordLandowner,
    this.costCenters,
    this.car,
    this.stateRegistration,
    this.externalCode,
    this.plots,
    this.company,
    this.name,
    this.areaAcre,
    this.contracts,
    this.caepf,
    this.cnae,
    this.attachmentNames,
    this.attachments,
    this.lastPlot,
    this.active,
  });

}

class Item {
  final int? id;
  final AttachmentNames? name;
  final int? unitPrice;
  final DateTime? dtPayment;
  final CompanyType? paymentMethod;
  final CompanyType? paymentPeriodicity;
  final ContractCoverageContract? contract;

  Item({
    this.id,
    this.name,
    this.unitPrice,
    this.dtPayment,
    this.paymentMethod,
    this.paymentPeriodicity,
    this.contract,
  });

}

class ContentPlot {
  final int? id;
  final Plot? plotGroup;
  final Coordinate? coordinate;
  final Plot? plotOwnerShipType;
  final int? number;
  final PlotCropDiversity? plotCropDiversity;
  final bool? isLease;
  final int? area;
  final List<CompanyCostCenter>? costCenters;
  final DateTime? dtLastPlanting;
  final int? atr;
  final int? tch;
  final List<PlotSoilStage>? plotSoilStages;

  ContentPlot({
    this.id,
    this.plotGroup,
    this.coordinate,
    this.plotOwnerShipType,
    this.number,
    this.plotCropDiversity,
    this.isLease,
    this.area,
    this.costCenters,
    this.dtLastPlanting,
    this.atr,
    this.tch,
    this.plotSoilStages,
  });

}

class PlotCropDiversity {
  final Id? id;
  final DateTime? dtStart;
  final PurpleCropDiversity? cropDiversity;

  PlotCropDiversity({
    this.id,
    this.dtStart,
    this.cropDiversity,
  });

}

class PurpleCropDiversity {
  final int? id;
  final AttachmentNames? name;
  final CompanyType? technologyType;
  final PlantingType? plantingType;
  final PlantingCycle? plantingCycle;
  final CompanyType? crop;
  final int? plantingCycleDays;
  final AttachmentNames? unconventionalTechnology;

  PurpleCropDiversity({
    this.id,
    this.name,
    this.technologyType,
    this.plantingType,
    this.plantingCycle,
    this.crop,
    this.plantingCycleDays,
    this.unconventionalTechnology,
  });

}

class Plot {
  final int? id;
  final AttachmentNames? name;

  Plot({
    this.id,
    this.name,
  });

}

class PlotSoilStage {
  final int? id;
  final LastPlotElement? plot;
  final DateTime? dtStart;
  final CompanyType? soilStage;

  PlotSoilStage({
    this.id,
    this.plot,
    this.dtStart,
    this.soilStage,
  });

}

class RuralProducer {
  final int? id;
  final DateTime? dtBirth;
  final AttachmentNames? stateRegistration;
  final AttachmentNames? name;
  final AttachmentNames? cpf;
  final List<AccountElement>? accounts;
  final List<ContractCoverageContract>? contracts;
  final List<AttachmentNames>? attachmentNames;
  final List<AttachmentNames>? attachments;
  final List<CompanyType>? commonAssociation;
  final List<Farm>? farms;
  final bool? active;

  RuralProducer({
    this.id,
    this.dtBirth,
    this.stateRegistration,
    this.name,
    this.cpf,
    this.accounts,
    this.contracts,
    this.attachmentNames,
    this.attachments,
    this.commonAssociation,
    this.farms,
    this.active,
  });

}

class PurpleEmail {
  final int? id;
  final AttachmentNames? email;

  PurpleEmail({
    this.id,
    this.email,
  });

}

class Pageable {
  final int? offset;
  final Sort? sort;
  final int? pageNumber;
  final int? pageSize;
  final bool? paged;
  final bool? unpaged;

  Pageable({
    this.offset,
    this.sort,
    this.pageNumber,
    this.pageSize,
    this.paged,
    this.unpaged,
  });

}

class Sort {
  final bool? empty;
  final bool? sorted;
  final bool? unsorted;

  Sort({
    this.empty,
    this.sorted,
    this.unsorted,
  });

}
