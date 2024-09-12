import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/company_entitties/company_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/farm_entities/farm_entity.dart';

import '../multipart_file_custom_entities/multipart_file_custom_entity.dart';
import '../rural_producer_entities/rural_producer_entity.dart';

class ContractEntity extends Equatable{
  final int id;
  final CompanyEntity company;
  final CompanyEntity contractedCompany;
  final RuralProducerEntity ruralProducer;
  final FarmEntity farm;
  final String contract;
  final String dtContract;
  final String dtContractEnd;
  final List<MultipartFileCustom> attachments;
  final String description;
  final List<CostCenterEntity> costCenters;
  final List<PlotEntity> plots




  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}