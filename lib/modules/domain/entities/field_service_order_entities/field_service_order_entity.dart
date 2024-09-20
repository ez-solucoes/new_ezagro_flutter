import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/farm_entities/farm_history_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/machine_implement_entities/machine_implement_history_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/plot_entities/plot_history_entity.dart';

import '../crop_entities/crop_diversity_history_entity.dart';

class FieldServiceOrderEntity extends Equatable{
  final int id;
  final String activityStart;
  final String activityEnd;
  final FarmHistoryEntity farm;
  final List<PlotHistoryEntity> plots;
  final double areaTotal;
  final CropDiversityHistoryEntity cropDiversity;
  final List<MachineImplementHistoryEntity> machineImplements;




  @override
  List<Object?> get props => throw UnimplementedError();

}