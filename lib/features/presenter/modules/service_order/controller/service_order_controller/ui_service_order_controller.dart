import 'package:new_ezagro_flutter/core/enums/field_service_order_status_enum.dart';

import '../../../../../../core/enums/field_service_order_type_enum.dart';

class UiServiceOrderController {

  FieldServiceOrderTypeEnum? type;
  FieldServiceOrderStatusEnum? status;

  UiServiceOrderController({this.type, this.status});

  bool isFinished() {
     switch (status) {
       case FieldServiceOrderStatusEnum.completed:
         return true;
       default:
         return false;
     }
  }
}

